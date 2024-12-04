import SwiftUI

struct ContentView: View {
    @State private var users: [UserData] = [] // List of all registered users
    @State private var user: UserData? = nil // The currently logged-in user
    @State private var isLoggedIn = false // Tracks login status

    var body: some View {
        NavigationView {
            ZStack {
                // Background Color (Forest Green)
                Color.green.opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack {
                    Image("logo")
                        .resizable()
                           .scaledToFit()
                           .scaleEffect(0.8)
                    if isLoggedIn, let user = user {
                        // Main App View when logged in
                        MainAppView(user: $user)
                    } else {
                        // Sign Up and Log In Links
                        VStack(spacing: 20) {
                            NavigationLink(
                                "Sign Up",
                                destination: SwiftUIViewSignup(user: $user, users: $users, isLoggedIn: $isLoggedIn)
                            )
                            .font(.title2)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)

                            NavigationLink(
                                "Log In",
                                destination: SwiftUIViewLogin(user: $user, users: $users, isLoggedIn: $isLoggedIn)
                            )
                            .font(.title2)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                        .padding()
                        
                        // About Section Link
                        NavigationLink(
                            "About",
                            destination: AboutView()
                        )
                        .font(.headline)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .onAppear {
                    print("Users array in ContentView: \(users)")
                }
            }
        }
    }
}

// About Section View
struct AboutView: View {
    var body: some View {
        VStack {
            Text("About DashZane")
                .font(.largeTitle)
                .padding()

            Text("DashZane is a simple password manager to store and manage your credentials safely and securely.")
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("About DashZane")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
