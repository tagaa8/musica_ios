import SwiftUI

struct PlaylistDetailView: View {
    let playlist: Playlist
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var isEditingName = false
    @State private var editedName = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color.purple.opacity(0.2)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            LinearGradient(
                                colors: playlist.isAutomatic ? [.orange, .pink] : [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .frame(width: 150, height: 150)
                            .cornerRadius(12)
                            .overlay(
                                Image(systemName: playlist.isAutomatic ? "chart.line.uptrend.xyaxis" : "music.note.list")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                            )
                            .shadow(radius: 10)
                            
                            if isEditingName && !playlist.isAutomatic {
                                TextField("Nombre de playlist", text: $editedName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(maxWidth: 250)
                                    .onSubmit {
                                        saveEditedName()
                                    }
                            } else {
                                Text(playlist.name)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        if !playlist.isAutomatic {
                                            editedName = playlist.name
                                            isEditingName = true
                                        }
                                    }
                            }
                            
                            Text("\(playlist.songs.count) canciones")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    if !playlist.songs.isEmpty {
                                        audioManager.playQueue(playlist.songs)
                                    }
                                }) {
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Reproducir")
                                    }
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 12)
                                    .background(
                                        Capsule()
                                            .fill(Color.white)
                                    )
                                }
                                
                                Button(action: {
                                    if !playlist.songs.isEmpty {
                                        audioManager.shuffleEnabled = true
                                        audioManager.playQueue(playlist.songs.shuffled())
                                    }
                                }) {
                                    Image(systemName: "shuffle")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 44, height: 44)
                                        .background(
                                            Circle()
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                        )
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                        if playlist.songs.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "music.note")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray)
                                
                                Text("Sin canciones")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text("Añade canciones a esta playlist")
                                    .font(.caption)
                                    .foregroundColor(.gray.opacity(0.8))
                            }
                            .padding(.top, 50)
                        } else {
                            VStack(spacing: 0) {
                                ForEach(Array(playlist.songs.enumerated()), id: \.element.id) { index, song in
                                    SongRowView(
                                        song: song,
                                        onTap: {
                                            audioManager.playQueue(playlist.songs, startIndex: index)
                                        },
                                        onMoreTap: {
                                            // Manejar opciones adicionales
                                        }
                                    )
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    
                                    if index < playlist.songs.count - 1 {
                                        Divider()
                                            .background(Color.white.opacity(0.1))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Listo") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveEditedName() {
        if !editedName.isEmpty && editedName != playlist.name {
            if let index = dataManager.playlists.firstIndex(where: { $0.id == playlist.id }) {
                dataManager.playlists[index].name = editedName
                dataManager.saveData()
            }
        }
        isEditingName = false
    }
}