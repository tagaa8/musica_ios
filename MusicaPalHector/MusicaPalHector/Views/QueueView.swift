import SwiftUI

struct QueueView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                if audioManager.queue.isEmpty {
                    Spacer()
                    VStack(spacing: 16) {
                        Image(systemName: "music.note.list")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("Cola vacía")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text("Las canciones que agregues aparecerán aquí")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    Spacer()
                } else {
                    List {
                        if let currentSong = audioManager.currentSong {
                            Section("Reproduciendo ahora") {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(currentSong.title)
                                            .font(.headline)
                                            .lineLimit(1)
                                        Text(currentSong.artist)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "play.circle.fill")
                                        .foregroundColor(.purple)
                                        .font(.title2)
                                }
                                .listRowBackground(Color.purple.opacity(0.1))
                            }
                        }
                        
                        Section("Próximas canciones") {
                            ForEach(Array(audioManager.queue.enumerated()), id: \.offset) { index, song in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(song.title)
                                            .font(.headline)
                                            .lineLimit(1)
                                        Text(song.artist)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(index + 1)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.secondary.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                            .onDelete(perform: removeSongs)
                            .onMove(perform: moveSongs)
                        }
                    }
                }
            }
            .navigationTitle("Cola de reproducción")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
                
                if !audioManager.queue.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Limpiar") {
                            audioManager.clearQueue()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    private func removeSongs(at offsets: IndexSet) {
        for index in offsets {
            audioManager.removeFromQueue(at: index)
        }
    }
    
    private func moveSongs(from source: IndexSet, to destination: Int) {
        audioManager.queue.move(fromOffsets: source, toOffset: destination)
    }
}