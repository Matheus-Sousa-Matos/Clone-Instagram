//
//  ProfileView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 14/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            VStack(spacing: 12) {
                HStack{
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Post")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                        
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Followers")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                        
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Followings")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                    }
                    
                }
                .padding(.horizontal)
                
                VStack{
                    Text("Cristiano Ronaldo")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("Description Ronal")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
                Divider()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
