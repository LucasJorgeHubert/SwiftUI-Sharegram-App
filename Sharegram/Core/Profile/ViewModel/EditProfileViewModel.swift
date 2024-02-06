//
//  EditProfileViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        var updatedUser: User = user
        
        if let uiImage = uiImage {
            let imageURL = try? await ImageUploader.uploadImage(image: uiImage)
            updatedUser.profileImageURL = imageURL
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            updatedUser.fullname = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            updatedUser.bio = bio
        }
        
        if updatedUser != user {
//            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            try await UserClient().updateUserProfile(updatedUser: updatedUser)
        }
    }
}
