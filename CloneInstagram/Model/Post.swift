//
//  Post.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 29/05/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Sunset at the beach and more rock in life", likes: 412,
              imageUrl: "post_mock1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Sunset at the beach", likes: 253,
              imageUrl: "post_mock2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Mountain hike adventure", likes: 349,
              imageUrl: "post_mock1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Delicious homemade pizza", likes: 187,
              imageUrl: "post_mock2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "City lights at night", likes: 532,
              imageUrl: "post_mock1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Cozy reading nook", likes: 298,
              imageUrl: "post_mock3",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[5]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Gardening success!", likes: 214,
              imageUrl: "post_mock1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Exploring the forest", likes: 421,
              imageUrl: "post_mock2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Street art discovery", likes: 372,
              imageUrl: "post_mock3",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[8]),

        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Delicious smoothie bowl", likes: 199,
              imageUrl: "post_mock2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[2])
    ]
}
