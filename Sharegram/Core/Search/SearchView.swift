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
        NavigationView {
            ScrollView {
                LazyVStack(spacing:12) {
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            Image("userImage")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("username")
                                    .fontWeight(.semibold)
                                
                                Text("User Name")
                            }
                            .font(.footnote)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .opacity(0.6)
                                    .imageScale(.small)
                            }

                        }
                        .padding(.horizontal)
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search...")
            }
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
