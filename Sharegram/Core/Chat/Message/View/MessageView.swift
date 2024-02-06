import SwiftUI

struct MessageView: View {
    @StateObject var viewModel = MessageViewModel()
    
    let chat: Chat

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    if let messages = chat.messages {
                        ForEach(messages) { msg in
                            BubbleMessage(message: msg, isFromCurrentUser: msg.ownerId == chat.fromId)
                        }
                    }
                }.defaultScrollAnchor(.bottom)
                
                HStack {
                    TextField("New message", text: $viewModel.message)
                        .modifier(SGTextFieldModifier())
                    
                    Button {
                        if !viewModel.message.isEmpty {
                            print("send")
                        }
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .foregroundColor(viewModel.message.isEmpty  ? .gray : .purple)
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .padding(.trailing, 24)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        if let user = chat.toUser {
                            CircularProfileImageView(user: user, size: .icon)
                        }
                        
                        VStack(alignment: .leading) {
                            Text((chat.toUser?.fullname ?? chat.toUser?.username) ?? "")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        ChatView()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(chat: Chat.MOCK_CHAT[0])
    }
}
