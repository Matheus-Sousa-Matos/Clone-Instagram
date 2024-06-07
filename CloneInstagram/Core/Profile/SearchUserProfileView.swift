//
//  SwiftUIView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 28/05/24.
//

import SwiftUI

struct SearchUserProfileView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                UserProfileHeaderView()
                    .environmentObject(viewModel)
            }
            
            PostGridView(user: viewModel.user)
            
            .navigationTitle(viewModel.user.username)
        }
    }
}

struct SearchUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserProfileView()
            .environmentObject(ProfileViewModel(user: User.MOCK_USERS[0]))
    }
}


