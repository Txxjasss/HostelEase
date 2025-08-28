import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var opacity = 0.0
    @State private var offset: CGFloat = 30
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    Text("IIIT Lucknow")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.blue)
                    
                    Text("Hostel Rooms")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .opacity(opacity)
                .offset(y: offset)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.2)) {
                        opacity = 1.0
                        offset = 0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
