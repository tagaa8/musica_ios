import SwiftUI

struct AllSongsView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var audioManager: AudioManager
    @State private var searchText = ""
    @State private var showingActionSheet = false
    @State private var selectedSong: Song?
    @State private var showingPlaylistPicker = false
    
    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return dataManager.songs
        } else {
            return dataManager.searchSongs(query: searchText)
        }
    }
    
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
                    VStack(spacing: 0) {
                        ForEach(filteredSongs) { song in
                            SongRowView(
                                song: song,
                                onTap: {
                                    audioManager.playQueue(dataManager.songs, startIndex: dataManager.songs.firstIndex(where: { $0.id == song.id }) ?? 0)
                                },
                                onMoreTap: {
                                    selectedSong = song
                                    showingActionSheet = true
                                }
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            
                            Divider()
                                .background(Color.white.opacity(0.1))
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Todas las Canciones")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Buscar canciones...")
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(
                    title: Text(selectedSong?.title ?? ""),
                    buttons: actionSheetButtons()
                )
            }
            .sheet(isPresented: $showingPlaylistPicker) {
                if let song = selectedSong {
                    PlaylistPickerView(song: song)
                }
            }
        }
    }
    
    private func actionSheetButtons() -> [ActionSheet.Button] {
        guard let song = selectedSong else { return [.cancel()] }
        
        return [
            .default(Text("Añadir a la cola")) {
                audioManager.addToQueue(song)
            },
            .default(Text("Añadir a playlist")) {
                showingPlaylistPicker = true
            },
            .default(Text(song.isLiked ? "Quitar de Me Gusta" : "Añadir a Me Gusta")) {
                dataManager.toggleLike(for: song)
            },
            .default(Text("Reproducir siguiente")) {
                if audioManager.currentIndex < audioManager.queue.count - 1 {
                    audioManager.queue.insert(song, at: audioManager.currentIndex + 1)
                } else {
                    audioManager.addToQueue(song)
                }
            },
            .cancel()
        ]
    }
}