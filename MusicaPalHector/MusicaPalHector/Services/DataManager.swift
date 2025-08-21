import Foundation
import Combine

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    @Published var songs: [Song] = []
    @Published var playlists: [Playlist] = []
    @Published var likedSongs: [Song] = []
    @Published var playHistory: [PlayHistory] = []
    @Published var topSongs: [Song] = []
    
    private let userDefaults = UserDefaults.standard
    private let songsKey = "savedSongs"
    private let playlistsKey = "savedPlaylists"
    private let historyKey = "playHistory"
    
    init() {
        loadData()
        loadSampleSongs()
        updateTopSongs()
    }
    
    func loadData() {
        if let songsData = userDefaults.data(forKey: songsKey),
           let decodedSongs = try? JSONDecoder().decode([Song].self, from: songsData) {
            self.songs = decodedSongs
            self.likedSongs = decodedSongs.filter { $0.isLiked }
        }
        
        if let playlistsData = userDefaults.data(forKey: playlistsKey),
           let decodedPlaylists = try? JSONDecoder().decode([Playlist].self, from: playlistsData) {
            self.playlists = decodedPlaylists
        }
        
        if let historyData = userDefaults.data(forKey: historyKey),
           let decodedHistory = try? JSONDecoder().decode([PlayHistory].self, from: historyData) {
            self.playHistory = decodedHistory
        }
    }
    
    func saveData() {
        if let songsData = try? JSONEncoder().encode(songs) {
            userDefaults.set(songsData, forKey: songsKey)
        }
        
        if let playlistsData = try? JSONEncoder().encode(playlists) {
            userDefaults.set(playlistsData, forKey: playlistsKey)
        }
        
        if let historyData = try? JSONEncoder().encode(playHistory) {
            userDefaults.set(historyData, forKey: historyKey)
        }
    }
    
    func loadSampleSongs() {
        if songs.isEmpty {
            songs = [
                Song(title: "Summer Vibes", artist: "The Beats", duration: 180, filePath: "song1.mp3"),
                Song(title: "Night Drive", artist: "Electronic Dreams", duration: 240, filePath: "song2.mp3"),
                Song(title: "Coffee Shop", artist: "Jazz Collective", duration: 200, filePath: "song3.mp3"),
                Song(title: "Mountain Echo", artist: "Nature Sounds", duration: 150, filePath: "song4.mp3"),
                Song(title: "City Lights", artist: "Urban Flow", duration: 210, filePath: "song5.mp3")
            ]
            saveData()
        }
    }
    
    func toggleLike(for song: Song) {
        if let index = songs.firstIndex(where: { $0.id == song.id }) {
            songs[index].isLiked.toggle()
            
            if songs[index].isLiked {
                if !likedSongs.contains(where: { $0.id == song.id }) {
                    likedSongs.append(songs[index])
                }
            } else {
                likedSongs.removeAll { $0.id == song.id }
            }
            
            saveData()
        }
    }
    
    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
        saveData()
    }
    
    func deletePlaylist(_ playlist: Playlist) {
        playlists.removeAll { $0.id == playlist.id }
        saveData()
    }
    
    func addSongToPlaylist(_ song: Song, playlist: Playlist) {
        if let index = playlists.firstIndex(where: { $0.id == playlist.id }) {
            if !playlists[index].songs.contains(where: { $0.id == song.id }) {
                playlists[index].songs.append(song)
                playlists[index].lastModified = Date()
                saveData()
            }
        }
    }
    
    func removeSongFromPlaylist(_ song: Song, playlist: Playlist) {
        if let index = playlists.firstIndex(where: { $0.id == playlist.id }) {
            playlists[index].songs.removeAll { $0.id == song.id }
            playlists[index].lastModified = Date()
            saveData()
        }
    }
    
    func recordPlay(for song: Song, completed: Bool) {
        let history = PlayHistory(songId: song.id, playedAt: Date(), completedPlayback: completed)
        playHistory.append(history)
        
        if completed {
            if let index = songs.firstIndex(where: { $0.id == song.id }) {
                songs[index].playCount += 1
                songs[index].lastPlayed = Date()
                saveData()
            }
        }
        
        if playHistory.count > 1000 {
            playHistory = Array(playHistory.suffix(500))
        }
        
        saveData()
        updateTopSongs()
    }
    
    func updateTopSongs() {
        let tenDaysAgo = Calendar.current.date(byAdding: .day, value: -10, to: Date()) ?? Date()
        
        let recentHistory = playHistory.filter { 
            $0.playedAt >= tenDaysAgo && $0.completedPlayback
        }
        
        var songPlayCounts: [UUID: Int] = [:]
        for history in recentHistory {
            songPlayCounts[history.songId, default: 0] += 1
        }
        
        let sortedSongIds = songPlayCounts.sorted { $0.value > $1.value }
            .prefix(25)
            .map { $0.key }
        
        topSongs = sortedSongIds.compactMap { songId in
            songs.first { $0.id == songId }
        }
        
        if !playlists.contains(where: { $0.name == "Top 25 - Últimos 10 días" }) {
            let topPlaylist = Playlist(
                name: "Top 25 - Últimos 10 días",
                songs: topSongs,
                isAutomatic: true
            )
            playlists.append(topPlaylist)
        } else if let index = playlists.firstIndex(where: { $0.name == "Top 25 - Últimos 10 días" }) {
            playlists[index].songs = topSongs
            playlists[index].lastModified = Date()
        }
        
        saveData()
    }
    
    func searchSongs(query: String) -> [Song] {
        guard !query.isEmpty else { return songs }
        
        return songs.filter {
            $0.title.localizedCaseInsensitiveContains(query) ||
            $0.artist.localizedCaseInsensitiveContains(query)
        }
    }
}