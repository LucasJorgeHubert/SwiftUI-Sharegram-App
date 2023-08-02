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
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter { $0.user?.username == user.username }
    }
    
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
                ForEach(posts) { post in
                    Image(post.imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageDimension, height: imageDimension)
                        .clipped()
                }
            }
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
