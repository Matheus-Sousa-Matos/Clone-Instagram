//
//  ProfileViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 05/06/24.
//

import Foundation
import Firebase

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var isLoading = false
    @Published var showEditProfile = false

    init(user: User) {
        self.user = user
        Task {
            await fetchUser()
        }
    }
    
    func fetchUser() async {
        isLoading = true
        do {
            self.user = try await UserService.fetchUser(withUid: user.id)
        } catch {
            print("Error fetching posts: \(error)")
        }
        isLoading = false
    }
}
