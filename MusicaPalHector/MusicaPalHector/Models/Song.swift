import Foundation
import CoreData

struct Song: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var artist: String
    var duration: TimeInterval
    var filePath: String
    var isLiked: Bool = false
    var playCount: Int = 0
    var lastPlayed: Date?
    var dateAdded: Date = Date()
    
    init(id: UUID = UUID(), title: String, artist: String, duration: TimeInterval, filePath: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.duration = duration
        self.filePath = filePath
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Song, rhs: Song) -> Bool {
        lhs.id == rhs.id
    }
}

struct Playlist: Identifiable, Codable {
    let id: UUID
    var name: String
    var songs: [Song]
    var dateCreated: Date
    var lastModified: Date
    var isAutomatic: Bool = false
    
    init(id: UUID = UUID(), name: String, songs: [Song] = [], isAutomatic: Bool = false) {
        self.id = id
        self.name = name
        self.songs = songs
        self.dateCreated = Date()
        self.lastModified = Date()
        self.isAutomatic = isAutomatic
    }
}

struct PlayHistory: Codable {
    let songId: UUID
    let playedAt: Date
    let completedPlayback: Bool
}

enum RepeatMode: String, CaseIterable {
    case off = "off"
    case one = "one"
    case all = "all"
    
    var systemImage: String {
        switch self {
        case .off: return "repeat"
        case .one: return "repeat.1"
        case .all: return "repeat"
        }
    }
}