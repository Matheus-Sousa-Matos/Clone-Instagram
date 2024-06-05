//
//  RegisterViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 31/05/24.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username, fullname: fullname)
        clearData()
    }
    
    private func clearData() {
        email = ""
        username = ""
        password = ""
        fullname = ""
    }
    
}
