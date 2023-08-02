//
//  FeedView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        // MARK: - Navigation
        NavigationStack {
            ScrollView{
                // MARK: - Build feed cell
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS) { post in
                        // MARK: - FeedCell Component
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            // MARK: - NavigationSetup
            .navigationTitle("Wellcome")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("SharegramLogo")
                        .resizable()
                        .frame(width: 110, height: 32)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
