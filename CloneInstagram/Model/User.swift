//
//  User.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 28/05/24.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String
    var fullname: String
    var bio: String?
    var email: String
    var ammountPost: Int
    var ammountFollowers: Int
    var ammountFollowing: Int
    
    var isCurrentUser: Bool {
        guard let currendUid = Auth.auth().currentUser?.uid else { return false }
        return currendUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "catia_alencar1", profileImageUrl: "ic_placeholder_user", fullname: "Catia Alencar", bio: "Desing de Moda", email: "catia.alencar@gmail.com", ammountPost: 0, ammountFollowers: 0, ammountFollowing: 0),
        .init(id: NSUUID().uuidString, username: "joao_silva99", profileImageUrl: "ic_placeholder_user", fullname: "João Silva", bio: "Engenheiro Civil", email: "joao.silva@gmail.com", ammountPost: 0, ammountFollowers: 0, ammountFollowing: 0),
        .init(id: NSUUID().uuidString, username: "maria_oliveira85", profileImageUrl: "ic_placeholder_user", fullname: "Maria Oliveira", bio: "Arquiteta", email: "maria.oliveira@gmail.com", ammountPost: 0, ammountFollowers: 0, ammountFollowing: 0),
        .init(id: NSUUID().uuidString, username: "pedro_santos10", profileImageUrl: "ic_placeholder_user", fullname: "Pedro Santos", bio: "Desenvolvedor de Software", email: "pedro.santos@gmail.com", ammountPost: 0, ammountFollowers: 0, ammountFollowing: 0),
        .init(id: NSUUID().uuidString, username: "ana_rodrigues12", profileImageUrl: "ic_placeholder_user", fullname: "Ana Rodrigues", bio: "Médica", email: "ana.rodrigues@gmail.com", ammountPost: 0, ammountFollowers: 0, ammountFollowing: 0)
    ]
}
