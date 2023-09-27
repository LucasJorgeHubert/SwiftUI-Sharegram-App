//
//  FeedCell.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            // MARK: - User image and username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .small)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // MARK: - Post image
            
            Image(post.imageURL)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // MARK: - Post action Buttons
            /* Like | Comment | Share */
            
            HStack(spacing: 16) {
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                    
                }
                
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                    
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    
                }
                
                Spacer()

            }
            .padding()
            .foregroundColor(.purple)
            
            // MARK: - Like counter
            
            Text("\(post.likes) Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // MARK: - Comments
            
            HStack {
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) + Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.horizontal)
            .padding(.top, 1)
            
            // MARK: - Post time
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 1)
                .foregroundColor(Color(.systemPurple).opacity(0.5))
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
