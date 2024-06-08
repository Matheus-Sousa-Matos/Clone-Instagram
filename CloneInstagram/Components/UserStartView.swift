//
//  UserStartView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 24/05/24.
//

import SwiftUI

struct UserStartView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

struct UserStartView_Previews: PreviewProvider {
    static var previews: some View {
        UserStartView(value: 32, title: "Post")
    }
}
