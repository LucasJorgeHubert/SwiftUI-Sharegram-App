//
//  BubbleMessage.swift
//  Sharegram
//
//  Created by Lucas Hubert on 17/10/23.
//

import SwiftUI

struct BubbleMessage: View {
    var message: Message
    var isFromCurrentUser: Bool
    
    var body: some View {
        VStack(alignment: isFromCurrentUser ? .trailing : .leading) {
                HStack {
                    Text(message.message)
                        .padding()
                        .background(isFromCurrentUser ? .purple.opacity(0.8) : .gray.opacity(0.3))
                        .foregroundColor(isFromCurrentUser ? .white : .black)
                        .cornerRadius(30)
                }
                .frame(maxWidth: 300, alignment: isFromCurrentUser ? .trailing : .leading)
                
                Text("\(message.timestamp.dateValue().formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(isFromCurrentUser ? .leading : .trailing , 25)
                
            }
            .frame(maxWidth: .infinity, alignment: isFromCurrentUser ? .trailing : .leading)
            .padding(isFromCurrentUser ? .trailing : .leading)
            .padding(.horizontal, 10)
        }
}

struct BubbleMessage_Previews: PreviewProvider {
    static var previews: some View {
        BubbleMessage(message: Message.MOCK_MESSAGES[0], isFromCurrentUser: false)
    }
}
