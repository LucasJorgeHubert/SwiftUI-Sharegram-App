//
//  UploadPostViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
    @Published var caption = ""
    private var uiImage: UIImage?
    
    private var postNewPostUseCase: Domain.Post.UseCase.PostNewPost
    private var postImagePostUseCase: Domain.Post.UseCase.PostImagePost
    
    init(
        postNewPostUseCase: Domain.Post.UseCase.PostNewPost = Domain.Post.UseCase.PostNewPost(),
        postImagePostUseCase: Domain.Post.UseCase.PostImagePost = Domain.Post.UseCase.PostImagePost()
    ) {
        self.postNewPostUseCase = postNewPostUseCase
        self.postImagePostUseCase = postImagePostUseCase
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func postPost() async throws {
        guard let uiImage = uiImage else { return }
        let imageURL = try await postImagePostUseCase.execute(postImage: uiImage)
        
        let post = Domain.Post.Model.Post(
            id: "",
            ownerUid: AuthService.shared.currentUser?.id ?? "",
            caption: caption,
            likesCount: 0,
            likesUids: [],
            comentsCount: 0,
            comentsUids: [],
            shareCount: 0,
            imageURL: imageURL,
            timestamp: Timestamp()
        )
        
        try await postNewPostUseCase.execute(post: post)
    }
}
