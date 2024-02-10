//
//  SignUp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
import SwiftUI
 // SignUp View
struct SignUp: View {
    // State properties
    @State private var username = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var age = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // First name and last name fields
                NameFields()
                
                // Email field
                SecureField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                // Username field
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                
                // Password and confirm password fields
                PasswordFields()
                // Sign up button
                SignUpButton()
                // Log button
                LogButton()
            }
            .padding()
            .navigationBarTitle("Sign Up")
        }
    }
    
    func signUp() {
        // Implement your sign-up logic here
        print("Signing up...")
    }
}

// Separate Views

struct NameFields: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        HStack(spacing: 20) {
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct PasswordFields: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct SignUpButton: View {
    var body: some View {
        Button(action: {
            // Call sign-up function
        }) {
            Text("Sign Up")
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

struct LogButton: View {
    var body: some View {
        NavigationLink(destination: logView()) {
            Text("Already have an account? ")
                .foregroundColor(.blue)
            +
            Text("Sign in ")
                .foregroundColor(.blue)
                .bold()
                .underline()
        }
    }
}

// Preview
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
