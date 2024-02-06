//
//  ListUsersView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/10/23.
//

import SwiftUI

struct ListUsersView: View {
    let users: [User]
    
    var body: some View {
    
        ForEach(users) { user in
            NavigationLink(value: user) {
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
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ListUsersView(users: User.MOCK_USERS)
}
