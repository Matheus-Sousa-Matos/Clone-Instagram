//
//  FeedViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 03/06/24.
//

import SwiftUI
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var isLoading = false

    init() {
        Task {
            await fetchPosts()
        }
    }
    
    func fetchPosts() async {
        isLoading = true
        do {
            self.posts = try await PostService.fetchFeedPosts()
        } catch {
            print("Error fetching posts: \(error)")
            self.posts = []
        }
        isLoading = false
    }
}
