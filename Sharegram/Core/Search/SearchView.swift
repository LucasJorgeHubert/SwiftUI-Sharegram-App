//
//  SearchView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 31/05/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing:12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            // MARK: - User search cell
                            HStack {
                                // MARK: - User image
                                Image(user.profileImageURL ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
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
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
