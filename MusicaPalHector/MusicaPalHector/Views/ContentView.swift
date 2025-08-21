import SwiftUI

struct ContentView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedTab = 0
    @State private var showingNowPlaying = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, Color.purple.opacity(0.3), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    AllSongsView()
                        .tabItem {
                            Label("Canciones", systemImage: "music.note")
                        }
                        .tag(0)
                    
                    PlaylistsView()
                        .tabItem {
                            Label("Playlists", systemImage: "music.note.list")
                        }
                        .tag(1)
                    
                    LikedSongsView()
                        .tabItem {
                            Label("Me Gusta", systemImage: "heart.fill")
                        }
                        .tag(2)
                }
                .accentColor(.purple)
                
                if audioManager.currentSong != nil {
                    MiniPlayerView(showingNowPlaying: $showingNowPlaying)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .sheet(isPresented: $showingNowPlaying) {
            NowPlayingView()
        }
    }
}