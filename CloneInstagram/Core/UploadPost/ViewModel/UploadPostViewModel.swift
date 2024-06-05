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
        didSet {
            Task {
                await loadImage(from: selectedImage)
            }
        }
    }
    @Published var postImage: Image?
    @Published var caption: String = ""
    private var uiImage: UIImage?

    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: data) else { return }
            self.uiImage = uiImage
            self.postImage = Image(uiImage: uiImage)
        } catch {
            print("Error loading image: \(error)")
        }
    }
    
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Error: No user is currently logged in.")
            return
        }
        guard let uiImage = uiImage else {
            print("Error: No image selected.")
            return
        }
        
        do {
            let postRef = Firestore.firestore().collection("posts").document()
            guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {
                print("Error: No imageUrl using uploadImage")
                return
            }
            
            let post = Post(
                id: postRef.documentID,
                ownerUid: uid,
                caption: self.caption,
                likes: 0,
                imageUrl: imageUrl,
                timestamp: Timestamp()
            )
            
            try postRef.setData(from: post)
            clearData()
        } catch {
            print("Error uploading post: \(error)")
            throw error
        }
    }
    
    func clearData() {
        caption = ""
        selectedImage = nil
        postImage = nil
    }
}
