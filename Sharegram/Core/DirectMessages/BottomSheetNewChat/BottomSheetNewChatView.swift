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
    
    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search user", text: $searchText)
                    .padding()
                    .background(.quinary)
                    .cornerRadius(10)
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        SelectListUsersView(users: viewModel.users)
                    }
                }
            }
            .navigationTitle("New Chat")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BottomSheetNewChatView()
}
