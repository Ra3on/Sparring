//
//  logIn.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
//
import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView { // Wrap the entire view in a NavigationView
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    UserCredentialsForm()
                    
                    NavigationLink(destination: ForgotPasswordView()) { // Navigate to ForgotPasswordView
                        Text("Forgot Password?")
                            .foregroundColor(.blue)
                    }
                    
                    LoginButton()
                    
                    SignButton()
                }
                .padding()
            }
        }
    }
}

struct UserCredentialsForm: View {
    @State private var username = ""
    @State private var password = ""
    
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
    var body: some View {
        NavigationLink(destination: MainView()) { // Navigate to your main view after login
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(.black.opacity(0.8)))
                .cornerRadius(20)
                .padding(.vertical)
        }
    }
}

struct SignButton: View {
    var body: some View {
        NavigationLink(destination: SignUpView()) {
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
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password View") // Your forgot password screen content goes here
    }
}

struct MainView: View {
    var body: some View {
       MaiView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
