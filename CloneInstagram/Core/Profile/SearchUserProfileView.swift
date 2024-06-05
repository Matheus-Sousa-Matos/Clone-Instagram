//
//  SwiftUIView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 28/05/24.
//

import SwiftUI

struct SearchUserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            UserProfileHeaderView(user: user)
            
            PostGridView(user: user)
            
            .navigationTitle(user.username)
        }
    }
}

struct SearchUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserProfileView(user: User.MOCK_USERS[5])
    }
}


