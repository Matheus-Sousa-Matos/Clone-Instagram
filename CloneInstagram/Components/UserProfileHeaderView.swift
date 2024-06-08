//
//  UserProfileHeaderView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 01/06/24.
//

import SwiftUI

struct UserProfileHeaderView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            HStack{
                CircularProfileImageView(user: viewModel.user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStartView(value: viewModel.user.ammountPost, title: "Post")
                    UserStartView(value: viewModel.user.ammountFollowers, title: "Followers")
                    UserStartView(value: viewModel.user.ammountFollowing, title: "Followings")
                }
            }
            .padding(.horizontal, 32)
            
            VStack{
                if let fullname = viewModel.user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if let bio = viewModel.user.bio {
                    Text(bio)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal, 32)
            
            HStack {
                if viewModel.user.isCurrentUser {
                    NavigationLink {
                        EditProfileView(user: viewModel.user)
                            .toolbarRole(.editor)
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 160, height: 32)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(6)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                } else {
                    Button {
                       
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 160, height: 32)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.clear, lineWidth: 1)
                            }
                    }
                }
                
                Button {
                    if viewModel.user.isCurrentUser {
                        /// Share
                    } else {
                        /// Message
                    }
                } label: {
                    Text(viewModel.user.isCurrentUser ? "Share Profile" : "Message")
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
    }
}

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView()
            .environmentObject(ProfileViewModel(user: User.MOCK_USERS[0]))
    }
}
