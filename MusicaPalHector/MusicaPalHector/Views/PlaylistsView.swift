import SwiftUI

struct PlaylistsView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var audioManager: AudioManager
    @State private var showingCreatePlaylist = false
    @State private var newPlaylistName = ""
    @State private var selectedPlaylist: Playlist?
    
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
                        if let topPlaylist = dataManager.playlists.first(where: { $0.name == "Top 25 - Últimos 10 días" }) {
                            PlaylistCardView(
                                playlist: topPlaylist,
                                isAutomatic: true,
                                onTap: {
                                    selectedPlaylist = topPlaylist
                                }
                            )
                        }
                        
                        ForEach(dataManager.playlists.filter { $0.name != "Top 25 - Últimos 10 días" }) { playlist in
                            PlaylistCardView(
                                playlist: playlist,
                                isAutomatic: false,
                                onTap: {
                                    selectedPlaylist = playlist
                                }
                            )
                            .contextMenu {
                                Button(action: {
                                    dataManager.deletePlaylist(playlist)
                                }) {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                        }
                        
                        Button(action: {
                            showingCreatePlaylist = true
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.purple)
                                
                                VStack(alignment: .leading) {
                                    Text("Crear Playlist")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text("Añade tus canciones favoritas")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                            )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Playlists")
            .navigationBarTitleDisplayMode(.large)
            .sheet(item: $selectedPlaylist) { playlist in
                PlaylistDetailView(playlist: playlist)
            }
            .alert("Nueva Playlist", isPresented: $showingCreatePlaylist) {
                TextField("Nombre de la playlist", text: $newPlaylistName)
                Button("Cancelar", role: .cancel) {
                    newPlaylistName = ""
                }
                Button("Crear") {
                    if !newPlaylistName.isEmpty {
                        dataManager.createPlaylist(name: newPlaylistName)
                        newPlaylistName = ""
                    }
                }
            }
        }
    }
}

struct PlaylistCardView: View {
    let playlist: Playlist
    let isAutomatic: Bool
    let onTap: () -> Void
    
    var gradient: LinearGradient {
        if isAutomatic {
            return LinearGradient(
                colors: [.orange, .pink],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [.purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(gradient)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: isAutomatic ? "chart.line.uptrend.xyaxis" : "music.note.list")
                            .font(.title2)
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(playlist.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("\(playlist.songs.count) canciones")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    if isAutomatic {
                        Text("Actualizado automáticamente")
                            .font(.caption2)
                            .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1))
            )
        }
        .padding(.horizontal)
    }
}