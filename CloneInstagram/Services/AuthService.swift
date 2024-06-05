//
//  AuthService.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 30/05/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        Task { try await loadUserData() }
    }
    
    public func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("Debug: Failed to log in user with error: \(error.localizedDescription)")
        }
    }
    
    public func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Debug: Failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    /// Decode user data
    public func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    /// Encode user data
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
    
    public func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil 
    }
}
