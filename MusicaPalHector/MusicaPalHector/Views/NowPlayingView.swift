import SwiftUI

struct NowPlayingView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var isDragging = false
    @State private var waveformImage: UIImage?
    @State private var animateWave = false
    @State private var showQueue = false
    @State private var showOptionsMenu = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, Color.purple.opacity(0.3), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.down")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text("Música Pal Héctor")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button(action: {
                            showQueue.toggle()
                        }) {
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            showOptionsMenu.toggle()
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing)
                }
                .padding(.top, 40)
                
                Spacer()
                
                WaveformVisualizerView(audioLevels: audioManager.audioLevels)
                    .frame(height: min(150, UIScreen.main.bounds.height * 0.15))
                    .padding(.horizontal, 20)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text(audioManager.currentSong?.title ?? "Sin canción")
                        .font(UIScreen.main.bounds.height > 800 ? .largeTitle : .title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.horizontal, 20)
                    
                    Text(audioManager.currentSong?.artist ?? "")
                        .font(UIScreen.main.bounds.height > 800 ? .title3 : .body)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .padding(.vertical, UIScreen.main.bounds.height > 800 ? 30 : 15)
                
                VStack(spacing: UIScreen.main.bounds.height > 800 ? 15 : 8) {
                    HStack {
                        Text(formatTime(audioManager.currentTime))
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Slider(
                            value: Binding(
                                get: { audioManager.currentTime },
                                set: { audioManager.seek(to: $0) }
                            ),
                            in: 0...max(audioManager.duration, 1),
                            onEditingChanged: { editing in
                                isDragging = editing
                            }
                        )
                        .accentColor(.purple)
                        
                        Text(formatTime(audioManager.duration))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: UIScreen.main.bounds.width > 390 ? 45 : (UIScreen.main.bounds.width > 375 ? 35 : 25)) {
                        Button(action: {
                            audioManager.toggleShuffle()
                        }) {
                            Image(systemName: "shuffle")
                                .font(.system(size: UIScreen.main.bounds.width > 375 ? 22 : 18))
                                .foregroundColor(audioManager.shuffleEnabled ? .purple : .white.opacity(0.7))
                        }
                        
                        Button(action: {
                            audioManager.previous()
                        }) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: UIScreen.main.bounds.width > 375 ? 28 : 24))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            audioManager.togglePlayPause()
                        }) {
                            Image(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: UIScreen.main.bounds.height > 800 ? 64 : 48))
                                .foregroundColor(.white)
                        }
                        .scaleEffect(audioManager.isPlaying ? 1.0 : 0.95)
                        .animation(.easeInOut(duration: 0.1), value: audioManager.isPlaying)
                        
                        Button(action: {
                            audioManager.next()
                        }) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: UIScreen.main.bounds.width > 375 ? 28 : 24))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            audioManager.cycleRepeatMode()
                        }) {
                            Image(systemName: audioManager.repeatMode.systemImage)
                                .font(.system(size: UIScreen.main.bounds.width > 375 ? 22 : 18))
                                .foregroundColor(audioManager.repeatMode != .off ? .purple : .white.opacity(0.7))
                        }
                    }
                    .padding(.vertical, UIScreen.main.bounds.height > 800 ? 20 : 10)
                    
                    HStack(spacing: UIScreen.main.bounds.width > 390 ? 25 : (UIScreen.main.bounds.width > 375 ? 20 : 15)) {
                        Button(action: {
                            if let song = audioManager.currentSong {
                                dataManager.toggleLike(for: song)
                                if let index = dataManager.songs.firstIndex(where: { $0.id == song.id }) {
                                    audioManager.currentSong = dataManager.songs[index]
                                }
                            }
                        }) {
                            Image(systemName: (dataManager.songs.first(where: { $0.id == audioManager.currentSong?.id })?.isLiked ?? false) ? "heart.fill" : "heart")
                                .font(.system(size: UIScreen.main.bounds.height > 800 ? 24 : 20))
                                .foregroundColor((dataManager.songs.first(where: { $0.id == audioManager.currentSong?.id })?.isLiked ?? false) ? .pink : .white)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Image(systemName: "speaker.fill")
                                .font(.caption2)
                                .foregroundColor(.gray)
                            
                            Slider(value: $audioManager.volume, in: 0...1)
                                .frame(width: UIScreen.main.bounds.width > 390 ? 90 : (UIScreen.main.bounds.width > 375 ? 75 : 65))
                                .accentColor(.purple)
                            
                            Image(systemName: "speaker.wave.3.fill")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: UIScreen.main.bounds.height > 800 ? 24 : 20))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showQueue) {
            QueueView()
                .environmentObject(audioManager)
                .environmentObject(dataManager)
        }
        .confirmationDialog("Opciones", isPresented: $showOptionsMenu) {
            Button("Añadir a cola") {
                if let song = audioManager.currentSong {
                    audioManager.addToQueue(song)
                }
            }
            Button("Añadir a Me gusta") {
                if let song = audioManager.currentSong {
                    dataManager.toggleLike(for: song)
                    if let index = dataManager.songs.firstIndex(where: { $0.id == song.id }) {
                        audioManager.currentSong = dataManager.songs[index]
                    }
                }
            }
            Button("Cancelar", role: .cancel) { }
        }
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

struct WaveformVisualizerView: View {
    let audioLevels: [Float]
    @State private var animationPhase = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 2) {
                ForEach(0..<min(audioLevels.count, 30), id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .pink, .purple],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(
                            width: max(2, (geometry.size.width / 30) - 2),
                            height: max(8, min(geometry.size.height * 0.8, 
                                CGFloat(audioLevels[safe: index] ?? 0.3) * geometry.size.height * 
                                (0.3 + 0.4 * abs(sin(animationPhase + Double(index) * 0.2)))))
                        )
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 120)
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                animationPhase = .pi * 2
            }
        }
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}