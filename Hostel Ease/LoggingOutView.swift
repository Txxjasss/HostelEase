import SwiftUI
struct LoggingOutView: View {
    @State private var goToLogin = false
    @AppStorage("currentRoom") private var currentRoom: String?
    @AppStorage("userID") private var userID: String?
    @AppStorage("token") private var token: String?
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 60) {
                Text("Payment Confimed 💸")
                    .font(.headline)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                Text("Logging out...")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            performLogout()
        }
        .fullScreenCover(isPresented: $goToLogin) {
            LoginView()
        }
    }
    private func performLogout() {
        currentRoom = nil
        userID = nil
        token = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            goToLogin = true
        }
    }
}
#Preview {
    LoggingOutView()
}
