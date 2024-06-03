//
//  SwiftUIView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 28/05/24.
//

import SwiftUI

struct SearchUserProfileView: View {
    let user: User

    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            UserProfileHeaderView(user: user)
            
            PostGridView(posts: posts)
            
            .navigationTitle(user.username)
        }
    }
}

struct SearchUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserProfileView(user: User.MOCK_USERS[5])
    }
}


