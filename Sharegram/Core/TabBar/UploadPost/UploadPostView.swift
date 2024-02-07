//
//  UploadPostView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imgPickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // Action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // Post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption here...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imgPickerPresented.toggle()
        }
        .photosPicker(isPresented: $imgPickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
