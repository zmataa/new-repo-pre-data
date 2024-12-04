import SwiftUI

struct MainAppView: View {
    @Binding var user: UserData? // The currently logged-in user
    
    @State private var newWebsite = ""
    @State private var newUsername = ""
    @State private var newPassword = ""
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                if let user = user {
                    // Welcome Message
                    Text("Welcome, \(user.username)!")
                        .font(.largeTitle)
                        .padding()
                    
                    // Logout Button (Small, Gray background, Black text, Corner)
                    Button(action: logout) {
                        Text("Log Out")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(8)
                            .frame(width: 100)
                            .background(Color.gray)
                            .cornerRadius(8)
                    }
                    .padding([.bottom, .trailing], 20) // Position it at the bottom-right corner
                    
                    // Add New Credential Section
                    VStack(alignment: .leading) {
                        Text("Add New Credential")
                            .font(.headline)
                            .padding(.bottom, 10)
                        
                        TextField("Website", text: $newWebsite)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 5)
                        
                        TextField("Username", text: $newUsername)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 5)
                        
                        SecureField("Password", text: $newPassword)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 10)
                        
                        Button("Save Credential") {
                            if !newWebsite.isEmpty && !newUsername.isEmpty && !newPassword.isEmpty {
                                var mutableUser = user
                                mutableUser.addDataItem(username: newUsername, password: newPassword, website: newWebsite)
                                self.user = mutableUser
                                newWebsite = ""
                                newUsername = ""
                                newPassword = ""
                            }
                        }
                        .padding()
                    }
                    
                    Divider()
                    
                    // Saved Credentials Section
                    VStack(alignment: .leading) {
                        Text("Saved Credentials")
                            .font(.headline)
                            .padding(.bottom, 10)
                        
                        if user.dataList.isEmpty {
                            Text("No credentials saved yet.")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        } else {
                            ScrollView {
                                ForEach(user.dataList, id: \.website) { item in
                                    VStack(alignment: .leading) {
                                        Text("Website: \(item.website)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                        
                                        Text("Username: \(item.username)")
                                            .font(.subheadline)
                                        
                                        Text("Password: \(item.password)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding()
                } else {
                    Text("Error: No user found.")
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
    
    func logout() {
        user = nil // Clear the current user
    }
}
