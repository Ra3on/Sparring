//
//  SignUp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
import SwiftUI

// SignUp View
struct SignUp: View {
    // State properties
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
    
            VStack(spacing: 20) {
                // First name and last name fields
                NameFields(firstName: $firstName, lastName: $lastName)
                EmailField(email: $email)              // Email field
                UsernameField(username: $username)     // Username field
                
                PasswordFields(password: $password, confirmPassword: $confirmPassword)  // Password and confirm password fields
                SignUpButton()   // Sign up button
                LogButton()      // Log button
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
    @Binding var firstName: String
    @Binding var lastName: String
    
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

struct EmailField: View {
    @Binding var email: String
    
    var body: some View {
        SecureField("Email", text: $email)
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
    }
}

struct UsernameField: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
    }
}

struct PasswordFields: View {
    @Binding var password: String
    @Binding var confirmPassword: String
    
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
        NavigationLink(destination: logsView()) {
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


struct logsView: View {
    var body: some View {
        logView()
            .navigationBarBackButtonHidden(true)
    }
}

// Preview
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
