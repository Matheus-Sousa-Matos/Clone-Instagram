//
//  SearchViewModel.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 01/06/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            do {
                try await fetchAllUsers()
            } catch {
                print("Failed to fetch users: \(error)")
            }
        }
    }
    
    func fetchAllUsers() async throws {
        let fetchedUsers = try await UserService.fetchAllUsers()
        DispatchQueue.main.async {
            self.users = fetchedUsers
        }
    }    
}
