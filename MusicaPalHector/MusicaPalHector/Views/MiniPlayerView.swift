import SwiftUI

struct MiniPlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    @Binding var showingNowPlaying: Bool
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(audioManager.currentSong?.title ?? "")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                Text(audioManager.currentSong?.artist ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    audioManager.previous()
                }) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    audioManager.togglePlayPause()
                }) {
                    Image(systemName: audioManager.isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(LinearGradient(
                            colors: [.purple, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                )
                
                Button(action: {
                    audioManager.next()
                }) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(
            VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark)
        )
        .overlay(
            GeometryReader { geometry in
                Rectangle()
                    .fill(LinearGradient(
                        colors: [.purple, .pink],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(width: geometry.size.width * (audioManager.currentTime / max(audioManager.duration, 1)))
                    .frame(height: 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 2),
            alignment: .bottom
        )
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
        .padding(.horizontal)
        .padding(.bottom, 8)
        .offset(dragOffset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation
                }
                .onEnded { value in
                    if value.translation.height < -50 {
                        showingNowPlaying = true
                    }
                    withAnimation(.spring()) {
                        dragOffset = .zero
                    }
                }
        )
        .onTapGesture {
            showingNowPlaying = true
        }
    }
}

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}