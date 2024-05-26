//
//  CarouselStoriesView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 26/05/24.
//

import SwiftUI

struct CarouselStoriesView: View {
    var body: some View {
        VStack {
            Image("profile_placeholder_image")
                .resizable()
                .frame(width: 90, height: 90)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .strokeBorder(Gradient(colors: [.pink, .purple, .orange, .red]), lineWidth: 4)
                )
                .padding(4)
            
            Text("name_insta")
                .font(.footnote)
        }
    }
}

struct CarouselStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselStoriesView()
    }
}
