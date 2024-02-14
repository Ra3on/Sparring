//
//  ContentView.swift
//  Sparring
//
//  Created by Ramon De Santiago on 1/31/24.
//

import SwiftUI
import SwiftData
import Firebase
struct ContentView: View{
    @EnvironmentObject var viewModel: ViewModel
    var body: some View{
        Group {
            if $viewModel.userSession != nil {
                
                Userpage()
            } else{
                logView()
                
            }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

