import SwiftUI

struct RoomDetailView: View {
    @Binding var room: Room
    @AppStorage("allocatedRoom") var allocatedRoom: String = ""
    @Environment(\.dismiss) var dismiss   // 👈 gives us access to the back action
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Room \(room.number)")
                .font(.largeTitle)
                .padding()
            
            Text("\(room.occupied)/\(room.capacity) occupied")
                .foregroundColor(.gray)
                .font(.headline)
            
            // ✅ Case 1: Already allocated THIS room → Withdraw
            if allocatedRoom == room.number {
                Text("You have allocated Room \(allocatedRoom)")
                    .foregroundColor(.green)
                
                Button("Withdraw Allocation") {
                    if room.occupied > 0 {
                        room.occupied -= 1
                    }
                    allocatedRoom = ""
                    dismiss()   // 👈 go back after withdrawing
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
            }
            
            // ✅ Case 2: Already allocated ANOTHER room
            else if !allocatedRoom.isEmpty {
                Text("⚠️ You already allocated Room \(allocatedRoom). Withdraw first to change.")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            // ✅ Case 3: No allocation yet + space available → Allocate
            else if room.occupied < room.capacity {
                Button("Allocate This Room") {
                    room.occupied += 1
                    allocatedRoom = room.number
                    dismiss()   // 👈 go back after allocation
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
            }
            
            // ✅ Case 4: Room Full
            else {
                Text("Room Full!!!")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Room \(room.number)")
        .navigationBarTitleDisplayMode(.inline)
        // 👇 ensures default back button appears in top left
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    RoomDetailView(room: .constant(Room(number: "101", capacity: 2, occupied: 1)))
}
