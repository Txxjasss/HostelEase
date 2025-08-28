import SwiftUI

@main
struct HostelEaseApp: App {
    @AppStorage("allocatedRoom") private var allocatedRoom: String = ""
    
    var body: some Scene {
        WindowGroup {
                SplashView()   // user not logged in → show splash/login
        }
    }
}

