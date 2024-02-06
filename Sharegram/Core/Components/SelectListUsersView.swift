//
//  SelectListUsersView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 11/01/24.
//

import SwiftUI

struct SelectListUsersView: View {
    let users: [User]
    @Binding var selectedUser: User?
    
    var body: some View {
    
        ForEach(users) { user in
            // MARK: - User search cell
            HStack {
                // MARK: - User image
                CircularProfileImageView(user: user, size: .small)
                
                // MARK: - Username and name
                VStack(alignment: .leading) {
                    Text(user.username)
                        .fontWeight(.bold)
                    
                    Text(user.fullname ?? "")
                }
                .foregroundColor(.black)
                .font(.footnote)
                
                Spacer()
                
                if selectedUser == user {
                    Image(systemName: "checkmark.circle.fill")
                        .padding(.trailing)
                        .foregroundStyle(Color.purple)
                }
            }
            .padding(.horizontal)
            .onTapGesture {
                selectedUser = user
                print("User: ", user.username, "SelectedUser: ", selectedUser?.username ?? "")
            }
        }
    }
}

#Preview {
    SelectListUsersView(users: User.MOCK_USERS, selectedUser: .constant(User.MOCK_USERS[0]))
}
