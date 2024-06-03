//
//  UserProfileHeaderView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 01/06/24.
//

import SwiftUI

struct UserProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack{
                CircularProfileImageView(user: user, size: .large)
                
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
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 160, height: 32)
                        .background(user.isCurrentUser ? .white : .blue)
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                        }
                }
                
                Button {
                    if user.isCurrentUser {
                        /// Share
                    } else {
                        /// Message
                    }
                } label: {
                    Text(user.isCurrentUser ? "Share Profile" : "Message")
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
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
