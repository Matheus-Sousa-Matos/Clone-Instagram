//
//  LoginViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 31/05/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func sigIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
