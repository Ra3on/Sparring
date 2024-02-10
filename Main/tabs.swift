//
//  tabs.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/10/24.
//

import SwiftUI

struct tabs: View {
    var body: some View {
        TabView {
           
            Text("News")
                .tabItem {
                    VStack{
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }
                }
            Text("Matches")
                .tabItem {
                    VStack{
                        Image(systemName: "person.line.dotted.person.fill")
                        Text("match")
                    }
                }
            Text("")
                .tabItem {
                    VStack{
                        Image(systemName: "plus")
                    }
                }
            Text("messages")
                .tabItem {
                    VStack{
                        Image(systemName: "ellipses.bubble.fill")
                        Text("message")
                    }
                }
            Text("My Profile")
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("User")
                    }
                }
            
        }
    }
}

#Preview {
    tabs()
}
