//
//  UploadPostViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 30/05/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task { await loadImage(fromItem: selectedImage) }}
    }
    @Published var postImage: Image?
    @Published var caption: String = ""
    private var uiImage: UIImage?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, owenerUid: uid, captation: self.caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
    func clearData() {
        caption = ""
        selectedImage = nil
        postImage = nil
    }
}
