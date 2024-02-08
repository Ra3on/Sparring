//
//  SignUp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
//
import SwiftUI

struct SignUp: View {
    @State private var username = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var age = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4) // Background color
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) { // HStack for first name and last name
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                }
                
                SecureField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)

                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: signUp) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
