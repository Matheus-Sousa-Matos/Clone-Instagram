//
//  EditProfileViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 01/06/24.
//

import SwiftUI
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var fullname: String = ""
    @Published var bio: String = ""
    
    private var uiImage: UIImage?

    init(user: User) {
        self.user = user
        self.fullname = user.fullname
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else {
                print("Error: No data found.")
                return
            }
            guard let uiImage = UIImage(data: data) else {
                print("Error: Could not convert data to UIImage.")
                return
            }
            self.uiImage = uiImage
            profileImage = Image(uiImage: uiImage)
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            do {
                if let imageUrl = try await ImageUploader.uploadImage(image: uiImage) {
                    data["profileImageUrl"] = imageUrl
                } else {
                    print("Error: Image upload failed.")
                }
            } catch {
                print("Error uploading image: \(error.localizedDescription)")
            }
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
    func clearData() {
        selectedImage = nil
        profileImage = nil
    }
}
