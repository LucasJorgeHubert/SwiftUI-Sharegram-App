//
//  CurrentUserProfileView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 25/07/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: - Header
                ProfileHeaderView(user: user)
                
                // MARK: - Post Grid
                
                PostGridView(user: user)
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
        
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
