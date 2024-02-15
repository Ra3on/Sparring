//
//  ForgotPassword.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/8/24.
//

import SwiftUI

struct ForgotPassword: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    
                    EnterEmail()
                    EmailButton()
                    CancelButton()
                 }
                .padding()
            }
            .navigationBarTitle("Reset Password", displayMode: .inline)
        }
    }
}

struct EnterEmail: View {
   
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
            
        }
    }
}

struct EmailButton: View {
    var body: some View {
        NavigationLink(destination: MainsView()) {
            Text("Reset Password")
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
struct NewPasswordFields: View {
    @Binding var newPassword: String
    @Binding var confirmPassword: String
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("New Password", text: $newPassword)
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

struct CancelButton: View {
    var body: some View {
        NavigationLink(destination: EView()) {
           
            Text("Cancel")
                .foregroundColor(.blue)
                .bold()
                //.underline()
        }
    }
}



struct EView: View {
    var body: some View {
        logView(showSignInView: .constant(false)) 
            .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct MainsView: View {
    var body: some View {
        MainView()
            .navigationBarBackButtonHidden(true) // Hide the back button
    }
}



struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
            .navigationBarBackButtonHidden(true)
    }
}
