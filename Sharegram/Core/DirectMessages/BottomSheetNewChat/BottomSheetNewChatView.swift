//
//  SheetView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 20/10/23.
//

import SwiftUI

struct BottomSheetNewChatView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = BottomSheetViewModel()
    
    @State var selectedUser: User?
    @State private var navigateToNewView: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        SelectListUsersView(users: viewModel.users, selectedUser: $selectedUser)
                    }
                }
            }
            .padding()
            .navigationTitle("New Chat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            guard let usr = selectedUser else { return }
                            try? await viewModel.newChat(to: usr)
                            
                            navigateToNewView = true
                            
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                            .disabled(selectedUser == nil ? true : false)
                    })
                }
            }
        }
    }
}

#Preview {
    BottomSheetNewChatView()
}
