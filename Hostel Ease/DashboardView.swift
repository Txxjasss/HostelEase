import SwiftUI

struct Room: Identifiable {
    let id = UUID()
    let number: String
    let capacity: Int
    var occupied: Int
    var available: Bool {
        occupied < capacity
    }
}
struct DashboardView: View {
    let rollNumber: String
    let branchName: String
    @AppStorage("allocatedRoom") private var allocatedRoom: String = ""
    @State private var rooms = [
        Room(number: "101", capacity: 2, occupied: 1),
        Room(number: "102", capacity: 3, occupied: 2),
        Room(number: "103", capacity: 8, occupied: 4),
        Room(number: "104", capacity: 2, occupied: 2),
        Room(number: "105", capacity: 4, occupied: 1),
        Room(number: "201", capacity: 2, occupied: 2),
        Room(number: "202", capacity: 3, occupied: 1),
        Room(number: "203", capacity: 6, occupied: 3),
        Room(number: "204", capacity: 2, occupied: 1),
        Room(number: "205", capacity: 2, occupied: 2),
        Room(number: "301", capacity: 4, occupied: 2),
        Room(number: "302", capacity: 2, occupied: 0),
        Room(number: "303", capacity: 3, occupied: 3),
        Room(number: "304", capacity: 6, occupied: 6),
        Room(number: "305", capacity: 2, occupied: 1)
    ]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Welcome,")
                        .font(.headline)
                    Text("\(rollNumber) – \(branchName)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Last date : 23rd Sept 2025")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .padding([.top, .horizontal])
            // ✅ Show Current Room (if allocated)
            if !allocatedRoom.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("My Current Room")
                        .font(.headline)
                    NavigationLink(
                        destination: {
                            if let index = rooms.firstIndex(where: { $0.number == allocatedRoom }) {
                                RoomDetailView(room: $rooms[index])
                            } else {
                                Text("Room not found")
                            }
                        }
                    ) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Room \(allocatedRoom)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text("Tap to view details")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            // ✅ Rooms List
            List {
                ForEach(rooms.indices, id: \.self) { i in
                    NavigationLink(
                        destination: RoomDetailView(room: $rooms[i])
                    ) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Room \(rooms[i].number)")
                                    .font(.headline)
                                Text("\(rooms[i].occupied)/\(rooms[i].capacity) occupied")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if rooms[i].available {
                                Label("Available", systemImage: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Label("Full", systemImage: "xmark.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
        }
        .navigationTitle("Available Rooms")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    DashboardView(rollNumber: "LCI2024037", branchName: "CSAI")
}
