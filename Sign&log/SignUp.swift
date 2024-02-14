//
//  SignUp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
import SwiftUI
import Firebase

// SignUp View
struct SignUp: View {
    // State properties
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: ViewModel
    
    
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
                SignUpButton(firstName: $firstName, lastName: $lastName, email: $email, username: $username,password: $password )   // Sign up button
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
    @State private var passwordsMatch = true // State variable to track password match status
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Confirm Password", text: $confirmPassword, onCommit: {
                // Check if passwords match when user presses return/done
                passwordsMatch = password == confirmPassword
            })
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            
            // Error message if passwords don't match
            if !passwordsMatch {
                Text("Passwords do not match")
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
}
struct SignUpButton: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var username: String
    @Binding var password: String
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button(action: {
            signUp() // Call the signUp function when the button is tapped
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
    
    func signUp() {
        Task {
           
            try await viewModel.createUser (withEmail: email, lastname: lastName, Firstname: firstName, Username: username, Password: password)
                // Handle successful sign-up (if needed)
             
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
