//
//  ProfileHeaderView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            // MARK: - User image
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
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
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Another user")
                }
                
            } label: {
                Text(user.isCurrentUser ? "Edit profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : .purple)
                    .foregroundColor(user.isCurrentUser ? .purple : .white)
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
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
