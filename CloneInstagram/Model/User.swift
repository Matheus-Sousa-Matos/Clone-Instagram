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
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currendUid = Auth.auth().currentUser?.uid else { return false }
        return currendUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "catia_alencar1", profileImageUrl: nil, fullname: "Catia Alencar", bio: "Desing de Moda", email: "catia.alencar@gmail.com"),
        .init(id: NSUUID().uuidString, username: "joao_silva99", profileImageUrl: nil, fullname: nil, bio: "Engenheiro Civil", email: "joao.silva@gmail.com"),
        .init(id: NSUUID().uuidString, username: "maria_oliveira85", profileImageUrl: nil, fullname: "Maria Oliveira", bio: "Arquiteta", email: "maria.oliveira@gmail.com"),
        .init(id: NSUUID().uuidString, username: "pedro_santos10", profileImageUrl: nil, fullname: "Pedro Santos", bio: "Desenvolvedor de Software", email: "pedro.santos@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ana_rodrigues12", profileImageUrl: nil, fullname: "Ana Rodrigues", bio: "Médica", email: "ana.rodrigues@gmail.com"),
        .init(id: NSUUID().uuidString, username: "carlos_ferreira33", profileImageUrl: nil, fullname: "Carlos Ferreira", bio: "Advogado", email: "carlos.ferreira@gmail.com"),
        .init(id: NSUUID().uuidString, username: "mariana_barros44", profileImageUrl: nil, fullname: "Mariana Barros", bio: "Fotógrafa", email: "mariana.barros@gmail.com"),
        .init(id: NSUUID().uuidString, username: "luiz_pereira78", profileImageUrl: nil, fullname: "Luiz Pereira", bio: "Professor", email: "luiz.pereira@gmail.com"),
        .init(id: NSUUID().uuidString, username: "fernanda_gomes56", profileImageUrl: nil, fullname: "Fernanda Gomes", bio: "Chef de Cozinha", email: "fernanda.gomes@gmail.com"),
        .init(id: NSUUID().uuidString, username: "julia_martins67", profileImageUrl: nil, fullname: "Julia Martins", bio: "Psicóloga", email: "julia.martins@gmail.com")
    ]
}
