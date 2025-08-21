import SwiftUI

struct PlaylistPickerView: View {
    let song: Song
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var showingCreatePlaylist = false
    @State private var newPlaylistName = ""
    
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
                    VStack(spacing: 16) {
                        ForEach(dataManager.playlists.filter { !$0.isAutomatic }) { playlist in
                            Button(action: {
                                dataManager.addSongToPlaylist(song, playlist: playlist)
                                dismiss()
                            }) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(LinearGradient(
                                            colors: [.purple, .blue],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "music.note.list")
                                                .foregroundColor(.white)
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(playlist.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text("\(playlist.songs.count) canciones")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    if playlist.songs.contains(where: { $0.id == song.id }) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                )
                            }
                            .padding(.horizontal)
                        }
                        
                        Button(action: {
                            showingCreatePlaylist = true
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.purple)
                                
                                Text("Crear nueva playlist")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.purple.opacity(0.5), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Añadir a playlist")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
            .alert("Nueva Playlist", isPresented: $showingCreatePlaylist) {
                TextField("Nombre de la playlist", text: $newPlaylistName)
                Button("Cancelar", role: .cancel) {
                    newPlaylistName = ""
                }
                Button("Crear y añadir") {
                    if !newPlaylistName.isEmpty {
                        dataManager.createPlaylist(name: newPlaylistName)
                        if let newPlaylist = dataManager.playlists.last {
                            dataManager.addSongToPlaylist(song, playlist: newPlaylist)
                        }
                        newPlaylistName = ""
                        dismiss()
                    }
                }
            }
        }
    }
}