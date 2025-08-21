import SwiftUI
import AVFoundation

@main
struct MusicaPalHectorApp: App {
    @StateObject private var audioManager = AudioManager.shared
    @StateObject private var dataManager = DataManager.shared
    
    init() {
        setupAudioSession()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
                .environmentObject(dataManager)
                .preferredColorScheme(.dark)
        }
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
}