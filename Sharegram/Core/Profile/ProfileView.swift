//
//  ProfileView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/05/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Header
            VStack(spacing: 10) {
                // Pic and stats
                HStack {
                    Image("userImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        
                        UserStatView(value: 3, title: "Posts")
                        UserStatView(value: 3, title: "Followers")
                        UserStatView(value: 3, title: "Following")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
                
                // Name and bio
                VStack(alignment: .leading) {
                    Text("lkshubert")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("Lucas Hubert")
                        .font(.footnote)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // actionButton
                
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
            
            // postGrid
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
