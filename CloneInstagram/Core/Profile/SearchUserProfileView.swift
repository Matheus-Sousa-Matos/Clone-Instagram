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
            VStack(spacing: 12) {
                HStack{
                    Image(user.profileImageUrl ?? "ic_placeholder_user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStartView(value: 12, title: "Post")
                        UserStartView(value: 32, title: "Followers")
                        UserStartView(value: 31, title: "Followings")
                    }
                    
                }
                .padding(.horizontal)
                
                VStack{
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 160, height: 32)
                            .foregroundColor(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Message")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 160, height: 32)
                            .foregroundColor(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 32, height: 32)
                            .overlay {
                                Image(systemName: "person.fill.badge.plus")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                            }
                    }
                    
                }
         
                Divider()
            }
            
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


