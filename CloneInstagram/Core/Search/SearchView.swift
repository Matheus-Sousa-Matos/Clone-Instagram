//
//  SearchView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 26/05/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            Image("profile_placeholder_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 52, height: 52)
                                .clipShape(Circle())
                            VStack {
                                Text("Anne Roy")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("Developer and UI/UX Design")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
