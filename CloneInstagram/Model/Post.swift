//
//  Post.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 29/05/24.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let owenerUid: String
    let captation: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Sunset at the beach and more rock in life", likes: 412,
              imageUrl: "post_mock1",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        
        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Sunset at the beach", likes: 253,
              imageUrl: "post_mock2",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Mountain hike adventure", likes: 349,
              imageUrl: "post_mock1",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Delicious homemade pizza", likes: 187,
              imageUrl: "post_mock2",
              timestamp: Date(),
              user: User.MOCK_USERS[3]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "City lights at night", likes: 532,
              imageUrl: "post_mock1",
              timestamp: Date(),
              user: User.MOCK_USERS[4]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Cozy reading nook", likes: 298,
              imageUrl: "post_mock3",
              timestamp: Date(),
              user: User.MOCK_USERS[5]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Gardening success!", likes: 214,
              imageUrl: "post_mock1",
              timestamp: Date(),
              user: User.MOCK_USERS[4]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Exploring the forest", likes: 421,
              imageUrl: "post_mock2",
              timestamp: Date(),
              user: User.MOCK_USERS[3]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Street art discovery", likes: 372,
              imageUrl: "post_mock3",
              timestamp: Date(),
              user: User.MOCK_USERS[8]),

        .init(id: NSUUID().uuidString,
              owenerUid: NSUUID().uuidString,
              captation: "Delicious smoothie bowl", likes: 199,
              imageUrl: "post_mock2",
              timestamp: Date(),
              user: User.MOCK_USERS[2])
    ]
}
