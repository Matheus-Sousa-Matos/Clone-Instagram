//
//  ContentView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 14/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else if let currentUser = viewModel.currentUser {
                MainTabBarView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
