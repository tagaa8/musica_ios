import Foundation
import AVFoundation
import Combine
import MediaPlayer

class AudioManager: NSObject, ObservableObject {
    static let shared = AudioManager()
    
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    
    @Published var currentSong: Song?
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var volume: Float = 0.7
    @Published var shuffleEnabled = false
    @Published var repeatMode: RepeatMode = .off
    @Published var queue: [Song] = []
    @Published var currentIndex: Int = 0
    @Published var audioLevels: [Float] = Array(repeating: 0, count: 50)
    
    private var cancellables = Set<AnyCancellable>()
    private let dataManager = DataManager.shared
    
    override init() {
        super.init()
        setupRemoteCommandCenter()
        setupNowPlayingInfo()
    }
    
    func loadSong(_ song: Song) {
        currentSong = song
        
        guard let url = Bundle.main.url(forResource: song.filePath, withExtension: "mp3") else {
            print("No se pudo encontrar el archivo: \(song.filePath).mp3")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = volume
            audioPlayer?.isMeteringEnabled = true
            duration = audioPlayer?.duration ?? 0
            updateNowPlayingInfo()
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    func play() {
        audioPlayer?.play()
        isPlaying = true
        startTimer()
        
        if let song = currentSong {
            dataManager.recordPlay(for: song, completed: false)
        }
    }
    
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopTimer()
    }
    
    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    func next() {
        if queue.isEmpty { return }
        
        if shuffleEnabled {
            currentIndex = Int.random(in: 0..<queue.count)
        } else {
            currentIndex = (currentIndex + 1) % queue.count
        }
        
        loadSong(queue[currentIndex])
        if isPlaying {
            play()
        }
    }
    
    func previous() {
        if currentTime > 3 {
            seek(to: 0)
        } else {
            if queue.isEmpty { return }
            
            currentIndex = (currentIndex - 1 + queue.count) % queue.count
            loadSong(queue[currentIndex])
            if isPlaying {
                play()
            }
        }
    }
    
    func seek(to time: TimeInterval) {
        audioPlayer?.currentTime = time
        currentTime = time
    }
    
    func setVolume(_ value: Float) {
        volume = value
        audioPlayer?.volume = value
    }
    
    func toggleShuffle() {
        shuffleEnabled.toggle()
    }
    
    func cycleRepeatMode() {
        switch repeatMode {
        case .off:
            repeatMode = .all
        case .all:
            repeatMode = .one
        case .one:
            repeatMode = .off
        }
    }
    
    func addToQueue(_ song: Song) {
        queue.append(song)
    }
    
    func removeFromQueue(at index: Int) {
        guard index < queue.count else { return }
        queue.remove(at: index)
        if currentIndex > index {
            currentIndex -= 1
        }
    }
    
    func playQueue(_ songs: [Song], startIndex: Int = 0) {
        queue = songs
        currentIndex = startIndex
        if !queue.isEmpty {
            loadSong(queue[currentIndex])
            play()
        }
    }
    
    func clearQueue() {
        queue.removeAll()
        currentIndex = 0
        pause()
        currentSong = nil
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.updatePlaybackInfo()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updatePlaybackInfo() {
        currentTime = audioPlayer?.currentTime ?? 0
        
        audioPlayer?.updateMeters()
        
        for i in 0..<audioLevels.count {
            let power = audioPlayer?.averagePower(forChannel: 0) ?? -160
            let level = max(0, 1 + power / 160)
            audioLevels[i] = level * Float.random(in: 0.8...1.2)
        }
    }
    
    private func setupRemoteCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.addTarget { _ in
            self.play()
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { _ in
            self.pause()
            return .success
        }
        
        commandCenter.nextTrackCommand.addTarget { _ in
            self.next()
            return .success
        }
        
        commandCenter.previousTrackCommand.addTarget { _ in
            self.previous()
            return .success
        }
    }
    
    private func setupNowPlayingInfo() {
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
    private func updateNowPlayingInfo() {
        guard let song = currentSong else { return }
        
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = song.title
        nowPlayingInfo[MPMediaItemPropertyArtist] = song.artist
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = duration
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = isPlaying ? 1.0 : 0.0
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}

extension AudioManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let song = currentSong {
            dataManager.recordPlay(for: song, completed: true)
        }
        
        switch repeatMode {
        case .one:
            seek(to: 0)
            play()
        case .all:
            next()
        case .off:
            if currentIndex < queue.count - 1 {
                next()
            } else {
                isPlaying = false
            }
        }
    }
}