//
//  ProfileView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            // MARK: - Header
            ProfileHeaderView(user: user)
            
            // MARK: - Post Grid
            PostGridView(user: user)
            
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
