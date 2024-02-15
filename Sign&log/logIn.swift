//
//  logIn.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
import SwiftUI
import Firebase
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInResultModel{
    let idToken: String
    let accessToken: String
}

@MainActor
final class LogViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSigninResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC) //gidSignInResult.
        
        
        guard let idToken: String = gidSigninResult.user.idToken?.tokenString else{
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSigninResult.user.accessToken.tokenString
        
       let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        
        
    }
    
}

struct logView: View {
    @State private var isNavigated = false // Track navigation state
    @State private var username = ""
    @State private var password = ""
    @StateObject private var viewModel = LogViewModel()
    @Binding var showSignInView: Bool
    
    
    //@StateObject var loginData = loginViewModel()
    
    var body: some View {

        NavigationView {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    UserCredentialsForm(username: $username, password: $password)
                    ForgotPasswordLink()
                    LoginButton(username: $username, password: $password)
                    SignButton(isNavigated: $isNavigated) // Pass the state variable
                    // reequest parameter from google login
                    
                    Text("Or")
                    
                    GoogleSignInButton {
                        Task {
                            do {
                                // Handle Google sign-in here
                                try await viewModel.signInGoogle()
                                // If sign-in is successful, update UI or perform other actions
                                showSignInView = false
                            } catch {
                                // Handle any errors that occur during sign-in
                                print("Error:", error)
                            }
                        }
                    }

                    .clipShape(Capsule()) // Apply capsule shape
                    .cornerRadius(20)
                    .padding(.vertical)
                    .frame(height: 55) // Adjust the frame height as needed
                    .clipShape(Capsule()) // Apply capsule shape
                    .padding(.horizontal, 30)
                }
            }
            .navigationBarTitle("Log In", displayMode: .inline)
        }
    }

}

struct ForgotPasswordLink: View {
    var body: some View {
        NavigationLink(destination: ForgotPasswordView()) {
            Text("Forgot Password?")
                .foregroundColor(.blue)
        }
    }
}

struct UserCredentialsForm: View {
    @Binding var username: String
    @Binding var password: String // Changed to String
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $username)
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
        }
    }
}


struct LoginButton: View {
    @EnvironmentObject var viewModel: ViewModel // Inject the ViewModel
    @State private var showAlert = false // State variable to show an alert
    
    @Binding var username: String
    @Binding var password: String // Changed to String
    
    var body: some View {
        Button(action: {
            // Perform signing in action when button is tapped
            Task {
                do {
                    try await viewModel.signIn(withUser: username, password: password)
                    print("Login button tapped") // Print message to terminal
                } catch {
                    
                    // Show alert or handle error if needed
                    print("Error: \(error)")
                }
            }
        }) {
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(.black.opacity(0.8)))
                .padding(.vertical)
                .frame(height: 80) // Adjust the frame height as needed
                .clipShape(Capsule()) // Apply capsule shape
                .padding(.horizontal, 30)
        }
    }
}




struct SignButton: View {
    @Binding var isNavigated: Bool // Binding to track navigation state
    
    var body: some View {
        
        NavigationLink(destination: SignUpView().onAppear {
            self.isNavigated = true // Set the state variable to true when navigating
        }) {
            Text("Don't have an account? ")
                .foregroundColor(.blue)
            +
            Text("Sign up ")
                .foregroundColor(.blue)
                .bold()
                .underline()
                
        }
        
    }
}

struct SignUpView: View {
    var body: some View {
        SignUp()
            .navigationBarBackButtonHidden(true)
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        ForgotPassword()
            .navigationBarBackButtonHidden(true)
    }
}

struct MainView: View {
    var body: some View {
       
       Userpage()
            .navigationBarBackButtonHidden(true)
    }
}

struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView(showSignInView: .constant(false)) 
    }
}
