//
//  SparringApp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 1/31/24.
//

// SparringApp.swift
import SwiftUI
import Firebase

@main
struct SparringApp: App {
    @StateObject var viewModel = ViewModel() // Initialize ViewModel
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) // Inject ViewModel into environment
        }
    }
}


