//
//  SparringApp.swift
//  Sparring
//
//  Created by Ramon De Santiago on 1/31/24.
//

import SwiftUI
import Firebase
import SwiftData

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
