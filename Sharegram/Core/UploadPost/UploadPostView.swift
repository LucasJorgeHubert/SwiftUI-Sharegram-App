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
    @State private var photoItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            // Action tool bar
            HStack {
                Button {
                    print("Cancel post")
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload post")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // Post image and caption
            HStack(spacing: 8) {
                Image("Post-1")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                TextField("Enter your caption here...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imgPickerPresented.toggle()
        }
        .photosPicker(isPresented: $imgPickerPresented, selection: $photoItem)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
