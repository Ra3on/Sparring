//
//  Userpage.swift
//  Sparring
//
//  Created by Ramon De Santiago on 2/10/24.
//
import SwiftUI

struct Userpage: View {
    @State private var profileImage: Image? // State variable to hold the user's profile image
    @State private var username: String = "Unknown" 
    
    var body: some View {
        ZStack {
            // Profile picture and plus button
            VStack {
                ZStack {
                    if let image = profileImage {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle()) // Clip the image into a circle
                            .padding(.top, 20) // Adjust the top padding to move the image down
                    } else {
                        NoImage()
                            .padding(.top, 20)
                        PlusButton()
                            .offset(x: 65, y: -20)
                            .padding()
                    }

                }
                Text(username) // Display the username
                    .font(.headline)
            }
            UserInfoBox()
                .offset(y: 80)
        }
        .padding()
    }
}

struct NoImage: View {
    var body: some View {
        Image(systemName: "person.circle.fill") // Placeholder image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .foregroundColor(.gray)
            .clipShape(Circle()) // Clip the image into a circle
    }
}

struct UserInfoBox: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("User Information")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
            
            InfoRow(title: "Height", value: "")
            InfoRow(title: "Level", value: "")
            InfoRow(title: "Age", value: "")
            InfoRow(title: "Training Location", value: "")
            InfoRow(title: "Martial Arts", value: "")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title + ":")
                .fontWeight(.bold)
            Spacer()
            Text(value.isEmpty ? "Unknown" : value)
        }
        .padding(.vertical, 4)
    }
}

struct PlusButton: View {
    var body: some View {
        NavigationLink(destination: MainView()) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
        }
    }
}

struct Userpage_Previews: PreviewProvider {
    static var previews: some View {
        Userpage()
    }
}
