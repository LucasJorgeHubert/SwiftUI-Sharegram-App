//
//  FeedView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/05/23.
//

import SwiftUI

extension Presenter.TabBar.Feed {
    struct ViewScreen: View {
        @StateObject var viewModel = Presenter.TabBar.Feed.ViewModel()
        
        var body: some View {
            // MARK: - Navigation
            NavigationStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.purple)
                        .scaleEffect(2)
                } else {
                    ScrollView{
                        // MARK: - Build feed cell
                        LazyVStack(spacing: 32) {
                            ForEach(viewModel.posts) { post in
                                // MARK: - FeedCell Component
                                Presenter.TabBar.Feed.Cell.FeedCell(post: post, viewModel: viewModel)
                            }
                        }
                        .padding(.top, 8)
                    }
                    .refreshable {
                        Task {
                            viewModel.isLoading = true
                            try await viewModel.fetchPosts()
                            viewModel.isLoading = false
                        }
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
                            NavigationLink {
                                ChatView()
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        Presenter.TabBar.Feed.ViewScreen()
    }
}
