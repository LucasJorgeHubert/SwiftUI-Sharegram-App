//
//  ChatView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import SwiftUI
import PopupView

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel()
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.chats.isEmpty {
                    VStack {
                        Text("No messages")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Button("Start new message") {
                            showSheet.toggle()
                        }.sheet(isPresented: $showSheet) {
                            BottomSheetNewChatView()
                                .presentationDetents([.medium, .large])
                                .padding(.top, 24)
                        }
                    }
                } else {
                    LazyVStack(alignment: .leading, spacing: 8) {
                        Divider()
                        ForEach(viewModel.chats) { chat in
                            NavigationLink {
                                MessageView(chat: chat)
                            } label: {
                                HStack {
                                    if let userImage = chat.toUser {
                                        CircularProfileImageView(
                                            user: userImage,
                                            size: .medium
                                        )
                                    }
                                    
                                    VStack {
                                        Text((chat.toUser?.fullname ?? chat.toUser?.username) ?? "Unknowed user")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal, 8)
                                            .foregroundStyle(Color.black)
                                        
                                        Text(chat.lastMessage ?? "Last message not Loaded")
                                            .font(.footnote)
                                            .fontWeight(.regular)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal, 8)
                                            .foregroundStyle(Color.gray)
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
                            }
                            
                            Divider()
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem {
                    Button("New message", systemImage: "square.and.pencil") {
                        showSheet.toggle()
                    }.sheet(isPresented: $showSheet) {
                        BottomSheetNewChatView()
                            .presentationDetents([.medium, .large])
                            .padding(.top, 24)
                    }
                }
            }
        }
        .popup(isPresented: $viewModel.showPopup) {
            ToastTopFirst(text: viewModel.popupMessage)
        } customize: {
            $0.autohideIn(3)
                .type(.toast)
                .position(.bottom)
        }
    }
}

struct ToastTopFirst: View {
    
    var text = ""
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(32)
            .frame(maxWidth: .infinity)
            .background(.purple)
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
