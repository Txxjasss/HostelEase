import SwiftUI
import CoreImage.CIFilterBuiltins
struct PaymentView: View {
    let roomNumber: String
    let amount: Int = 5000
    @State private var qrImage: UIImage?
    @State private var showLogout = false
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        VStack(spacing: 20) {
            Text("Confirm & Pay")
                .font(.title)
                .fontWeight(.bold)
            Text("You have selected Room \(roomNumber)")
                .font(.headline)
            Text("Amount: ₹\(amount)")
                .font(.subheadline)
                .foregroundColor(.gray)
            if let qrImage = qrImage {
                Image(uiImage: qrImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
            } else {
                ProgressView("Generating QR...")
            }
            Text("Scan the QR code above to complete your payment.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                // Save allocation after payment success
                UserDefaults.standard.set(roomNumber, forKey: "allocatedRoom")
                // Triggers logout screen
                showLogout = true
            }) {
                Text("I have paid, Confirm Allocation")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 20)
        }
        .padding()
        .onAppear {
            generateQRCode(from: "Pay ₹\(amount) for Room \(roomNumber)")
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        // Present LogoutView
        .fullScreenCover(isPresented: $showLogout) {
            LogoutView()
        }
    }
    private func generateQRCode(from string: String) {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledImage = outputImage.transformed(by: transform)
            if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
                qrImage = UIImage(cgImage: cgImage)
            }
        }
    }
}
struct LogoutView: View {
    @State private var goToLogin = false
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                Text("Logging out...")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                goToLogin = true
            }
        }
        .fullScreenCover(isPresented: $goToLogin) {
            LoginView() // Replace with your actual login screen
        }
    }
}
#Preview {
    PaymentView(roomNumber: "101")
}
