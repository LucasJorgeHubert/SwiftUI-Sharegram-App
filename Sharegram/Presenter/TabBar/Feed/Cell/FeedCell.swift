//
//  FeedCell.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Domain.Post.Model.Post
    
    var body: some View {
        VStack {
            // MARK: - User image and username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .icon)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // MARK: - Post image
            
            KFImage(URL(string: post.imageURL))
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
                    Text(post.likesCount)
                        .font(.system(size: 14))
                }
                
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                    Text(post.comentsCount)
                        .font(.system(size: 14))
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    Text(post.shareCounts)
                        .font(.system(size: 14))
                }
                
                Spacer()

            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .foregroundColor(.purple)
            
            // MARK: - Comments
            
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) + Text(post.caption)
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
                .foregroundColor(Color(.systemPurple).opacity(0.8))
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Domain.Post.Model.Post.MOCK_POSTS[2])
    }
}
