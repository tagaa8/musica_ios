import SwiftUI

struct SongRowView: View {
    let song: Song
    let onTap: () -> Void
    let onMoreTap: () -> Void
    @EnvironmentObject var audioManager: AudioManager
    @State private var isAnimating = false
    
    var isCurrentSong: Bool {
        audioManager.currentSong?.id == song.id
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title)
                    .font(.headline)
                    .foregroundColor(isCurrentSong ? .purple : .white)
                    .lineLimit(1)
                
                Text(song.artist)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            if isCurrentSong && audioManager.isPlaying {
                HStack(spacing: 2) {
                    ForEach(0..<4) { index in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .bottom,
                                endPoint: .top
                            ))
                            .frame(width: 3, height: CGFloat.random(in: 10...25))
                            .animation(
                                Animation.easeInOut(duration: 0.4)
                                    .repeatForever()
                                    .delay(Double(index) * 0.1),
                                value: isAnimating
                            )
                    }
                }
                .frame(width: 20)
                .onAppear { isAnimating = true }
                .onDisappear { isAnimating = false }
            }
            
            Text(formatDuration(song.duration))
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
            
            Button(action: onMoreTap) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .contentShape(Rectangle())
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
        .background(
            isCurrentSong ?
            LinearGradient(
                colors: [Color.purple.opacity(0.1), Color.clear],
                startPoint: .leading,
                endPoint: .trailing
            ) : nil
        )
        .cornerRadius(8)
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}