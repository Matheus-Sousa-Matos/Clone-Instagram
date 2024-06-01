//
//  UserService.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 01/06/24.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snaptshot = try await Firestore.firestore().collection("users").getDocuments()
        return snaptshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}
