//
//  PostService.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 03/06/24.
//

import Foundation
import Firebase

struct PostService {
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        do {
            let snapshot = try await postsCollection.getDocuments()
            var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }
            
            for i in 0..<posts.count {
                let ownerUid = posts[i].ownerUid
                let postUser = try await UserService.fetchUser(withUid: ownerUid)
                posts[i].user = postUser
            }
            
            return posts
        } catch {
            print("Error fetching posts: \(error)")
            throw error
        }
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        do {
            let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
            return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
        } catch {
            print("Error fetching user posts: \(error)")
            throw error
        }
    }
}
