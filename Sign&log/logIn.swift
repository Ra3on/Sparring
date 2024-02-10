//
//  logIn.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
//
import SwiftUI

struct logView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    UserCredentialsForm()
                    ForgotPasswordLink()
                    LoginButton()
                    SignButton()
                 }
                .padding()
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
        NavigationLink(destination: MainView()) {
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
        ForgotPassword()
    }
}

struct MainView: View {
    var body: some View {
        UsersMainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
