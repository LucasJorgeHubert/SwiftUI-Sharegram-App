//
//  FeedView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        // MARK: - Navigation
        NavigationStack {
            ScrollView{
                // MARK: - Build feed cell
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
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
                    Button {
                        //
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.purple)
                    }
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
