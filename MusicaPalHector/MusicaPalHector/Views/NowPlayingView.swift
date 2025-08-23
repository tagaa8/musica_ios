import SwiftUI

struct NowPlayingView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var isDragging = false
    @State private var waveformImage: UIImage?
    @State private var animateWave = false
    
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
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding(.top, 40)
                
                Spacer()
                
                WaveformVisualizerView(audioLevels: audioManager.audioLevels)
                    .frame(height: 150)
                    .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text(audioManager.currentSong?.title ?? "Sin canción")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.horizontal)
                    
                    Text(audioManager.currentSong?.artist ?? "")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .padding(.vertical, 30)
                
                VStack(spacing: 15) {
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
                    .padding(.horizontal, 30)
                    
                    HStack(spacing: 50) {
                        Button(action: {
                            audioManager.toggleShuffle()
                        }) {
                            Image(systemName: "shuffle")
                                .font(.system(size: 22))
                                .foregroundColor(audioManager.shuffleEnabled ? .purple : .white.opacity(0.7))
                        }
                        
                        Button(action: {
                            audioManager.previous()
                        }) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            audioManager.togglePlayPause()
                        }) {
                            Image(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 64))
                                .foregroundColor(.white)
                        }
                        .scaleEffect(audioManager.isPlaying ? 1.0 : 0.95)
                        .animation(.easeInOut(duration: 0.1), value: audioManager.isPlaying)
                        
                        Button(action: {
                            audioManager.next()
                        }) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            audioManager.cycleRepeatMode()
                        }) {
                            Image(systemName: audioManager.repeatMode.systemImage)
                                .font(.system(size: 22))
                                .foregroundColor(audioManager.repeatMode != .off ? .purple : .white.opacity(0.7))
                        }
                    }
                    .padding(.vertical, 20)
                    
                    HStack(spacing: 30) {
                        Button(action: {
                            if let song = audioManager.currentSong {
                                dataManager.toggleLike(for: song)
                            }
                        }) {
                            Image(systemName: audioManager.currentSong?.isLiked ?? false ? "heart.fill" : "heart")
                                .font(.system(size: 24))
                                .foregroundColor(audioManager.currentSong?.isLiked ?? false ? .pink : .white)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Image(systemName: "speaker.fill")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Slider(value: $audioManager.volume, in: 0...1)
                                .frame(width: 120)
                                .accentColor(.purple)
                            
                            Image(systemName: "speaker.wave.3.fill")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 30)
                }
                
                Spacer()
            }
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
                ForEach(0..<audioLevels.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .pink, .purple],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(
                            width: (geometry.size.width / CGFloat(audioLevels.count)) - 2,
                            height: CGFloat(audioLevels[index]) * geometry.size.height * 
                                    (0.3 + 0.7 * sin(animationPhase + Double(index) * 0.1))
                        )
                        .animation(
                            .easeInOut(duration: 0.15),
                            value: audioLevels[index]
                        )
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                animationPhase = .pi * 2
            }
        }
    }
}