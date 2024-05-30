//
//  UploadPostViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 30/05/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task { await loadImage(fromItem: selectedImage) }}
    }
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return } 
        postImage = Image(uiImage: uiImage)
    }
}
