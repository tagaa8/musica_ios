import SwiftUI

struct LikedSongsView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var audioManager: AudioManager
    @State private var searchText = ""
    
    var filteredSongs: [Song] {
        let likedSongs = dataManager.songs.filter { $0.isLiked }
        
        if searchText.isEmpty {
            return likedSongs
        } else {
            return likedSongs.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.artist.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color.pink.opacity(0.2)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                if filteredSongs.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("Sin canciones favoritas")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text("Las canciones que marques con ❤️ aparecerán aquí")
                            .font(.caption)
                            .foregroundColor(.gray.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            HStack {
                                LinearGradient(
                                    colors: [.pink, .red],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .frame(width: 120, height: 120)
                                .cornerRadius(12)
                                .overlay(
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                )
                                .shadow(radius: 10)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Me Gusta")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(filteredSongs.count) canciones")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    HStack(spacing: 15) {
                                        Button(action: {
                                            if !filteredSongs.isEmpty {
                                                audioManager.playQueue(filteredSongs)
                                            }
                                        }) {
                                            HStack {
                                                Image(systemName: "play.fill")
                                                Text("Reproducir")
                                            }
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(
                                                Capsule()
                                                    .fill(Color.white)
                                            )
                                        }
                                        
                                        Button(action: {
                                            if !filteredSongs.isEmpty {
                                                audioManager.shuffleEnabled = true
                                                audioManager.playQueue(filteredSongs.shuffled())
                                            }
                                        }) {
                                            Image(systemName: "shuffle")
                                                .font(.body)
                                                .foregroundColor(.white)
                                                .frame(width: 32, height: 32)
                                                .background(
                                                    Circle()
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                )
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                            
                            VStack(spacing: 0) {
                                ForEach(Array(filteredSongs.enumerated()), id: \.element.id) { index, song in
                                    SongRowView(
                                        song: song,
                                        onTap: {
                                            audioManager.playQueue(filteredSongs, startIndex: index)
                                        },
                                        onMoreTap: {
                                            // Manejar opciones adicionales
                                        }
                                    )
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    
                                    if index < filteredSongs.count - 1 {
                                        Divider()
                                            .background(Color.white.opacity(0.1))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Me Gusta")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Buscar en Me Gusta...")
        }
    }
}