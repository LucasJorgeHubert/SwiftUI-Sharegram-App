//
//  ProfileView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
        ScrollView {
            // MARK: - Header
            VStack(spacing: 10) {
                // MARK: - User image
                HStack {
                    Image(user.profileImageURL ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    // MARK: - Stats
                    HStack(spacing: 8) {
                        UserStatView(value: 3, title: "Posts")
                        UserStatView(value: 3, title: "Followers")
                        UserStatView(value: 3, title: "Following")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
                
                // MARK: - Username and Name
                VStack(alignment: .leading) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                        .fontWeight(.semibold)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // MARK: - Button actions
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(
                                Color.purple,
                                lineWidth: 1
                            )
                        )
                }

                
                Divider()
            }
            .padding(.top, 8)
            
            // MARK: - Post Grid
            
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(0 ... 15, id: \.self) { index in
                    Image("userImage")
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
