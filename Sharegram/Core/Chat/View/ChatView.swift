//
//  ChatView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.chats) { chat in
                        HStack {
                            if let userImage = chat.toUser {
                                CircularProfileImageView(
                                    user: userImage,
                                    size: .medium
                                )
                            }
                            
                            VStack {
                                Text(chat.toUser?.fullname ?? "OwnerUser")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                
                                Text(chat.lastMessage ?? "Last message not Loaded")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                            
                            if chat.hasUnread {
                                Text("Unread")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .background(.purple)
                                    .cornerRadius(15)
                            }
                        }
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
