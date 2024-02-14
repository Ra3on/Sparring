//
//  cred.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/10/24.
//
import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        // Initialization code here if needed
    }
    
    func signIn(withUser user: String, password: String) async throws {
        
        print("yes")
        // Sign-in logic here
    }
    
    func createUser(withEmail email: String, lastname: String, Firstname: String, Username : String,Password: String) async throws {
        print("no")
        // Create user logic here
    }
    
    func signOut() {
        // Sign-out logic here
    }
    
    func deleteAccount() {
        // Delete account logic here
    }
    
    func fetchUser() async {
        // Fetch user logic here
    }
}
