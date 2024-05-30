//
//  AuthService.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 30/05/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
