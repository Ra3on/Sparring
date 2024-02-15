//
//  ContentView.swift
//  Sparring
//
//  Created by Ramon De Santiago on 1/31/24.
//

import SwiftUI
import SwiftData
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel // Inject ViewModel
    
    var body: some View {
        logView(showSignInView: .constant(false))  // Assuming logView is the initial view you're presenting
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

