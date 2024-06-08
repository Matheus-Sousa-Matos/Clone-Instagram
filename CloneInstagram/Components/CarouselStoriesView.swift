//
//  CarouselStoriesView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 26/05/24.
//

import SwiftUI
import Kingfisher

struct CarouselStoriesView: View {
    let user: User
    
    var body: some View {
        VStack {
            if !user.profileImageUrl.isEmpty {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .frame(width: 90, height: 90)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Gradient(colors: [.pink, .purple, .orange, .red]), lineWidth: 4)
                    )
                    .padding(4)
            } else {
                Image("ic_placeholder_user")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Gradient(colors: [.pink, .purple, .orange, .red]), lineWidth: 4)
                    )
                    .padding(4)
            }
            
            if user.isCurrentUser {
                Text("Your story")
                    .font(.footnote)
                    .foregroundColor(.gray)
            } else {
                Text(user.username)
                    .font(.footnote)
            }
        }
    }
}

struct CarouselStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselStoriesView(user: User.MOCK_USERS[0])
    }
}
