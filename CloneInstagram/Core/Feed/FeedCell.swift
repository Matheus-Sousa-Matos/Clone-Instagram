//
//  FeedCell.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 26/05/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("profile_placeholder_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Anne")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("2d ago")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 4)
                    .padding(.top, 1)
                    .foregroundColor(.gray)
                
                Image(systemName: "ellipsis")
                    .imageScale(.medium)
                    .padding(.trailing, 12)

            }
            .padding(.leading, 8)
            
            Image("profile_placeholder_image")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            Text("10.553 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                Text("Anne ").fontWeight(.semibold) +
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor reprehenderit  voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .lineLimit(2)
            
            Text("View all 800 comments")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
