//
//  ProfileView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 14/05/24.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    HStack{
                        Image("profile_placeholder_image")
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
                        Text("Anne Cristina")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Description")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
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
                            Text("Share Profile")
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
                
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0...15, id: \.self) { index in
                        Image("profile_placeholder_image")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Text("anne_cristiana")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.rectangle")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
