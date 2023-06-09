//
//  FeedCell.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // MARK: - User image and username
            HStack {
                Image("userImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("lkshubert")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            // MARK: - Post image
            
            Image("userImage")
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
            
            Text("20 Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // MARK: - Comments
            
            HStack {
                Text("Username ").fontWeight(.semibold) + Text("caption description")
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
        FeedCell()
    }
}
