import SwiftUI

struct LoginView: View {
    @State private var rollNumber = ""
    @State private var password = ""
    @State private var goToDashboard = false
    @State private var branchName = ""
    
    @AppStorage("allocatedRoom") private var allocatedRoom: String = "" // Persist allocation
    
    // Validation
    private var isFormValid: Bool {
        return isValidRollNumber(rollNumber) && password.count >= 6
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Student Login")
                    .font(.largeTitle)
                    .bold()
                
                // Roll Number field
                TextField("Enter Roll Number", text: $rollNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .autocapitalization(.allCharacters)
                
                // Password field
                SecureField("Enter Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Login button
                Button(action: {
                    branchName = extractBranch(from: rollNumber)
                    goToDashboard = true   // ✅ always goes to dashboard
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .disabled(!isFormValid)
                
                // Navigation to Dashboard
                NavigationLink(
                    "",
                    destination: DashboardView(rollNumber: rollNumber, branchName: branchName),
                    isActive: $goToDashboard
                )
            }
            .padding()
        }
    }
    
    // MARK: - Helper functions
    
    private func isValidRollNumber(_ roll: String) -> Bool {
        // Roll number must be 10 characters like "LCI2024037"
        let regex = #"^(LCI|LCB|LCS|LIT)\d{7}$"#
        return roll.range(of: regex, options: .regularExpression) != nil
    }
    
    private func extractBranch(from roll: String) -> String {
        if roll.hasPrefix("LCI") {
            return "Computer Science (AI)"
        } else if roll.hasPrefix("LCB") {
            return "Computer Science (Business)"
        } else if roll.hasPrefix("LCS") {
            return "Computer Science"
        } else if roll.hasPrefix("LIT") {
            return "Information Technology"
        }
        return "Unknown Branch"
    }
}

#Preview {
    LoginView()
}
