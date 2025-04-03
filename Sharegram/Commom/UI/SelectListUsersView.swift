//
//  SelectListUsersView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 11/01/24.
//

import SwiftUI

struct SelectListUsersView: View {
    let users: [Domain.User.Model.User]
    
    var body: some View {
    
        ForEach(users) { user in
            // MARK: - User search cell
            HStack {
                // MARK: - User image
                CircularProfileImageView(user: user, size: .icon)
                
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
            .padding(.vertical, 4)
            .onTapGesture { }
        }
    }
}

#Preview {
    SelectListUsersView(users: Domain.User.Model.User.MOCK_USERS)
}
