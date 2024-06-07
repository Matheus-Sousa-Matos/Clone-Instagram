//
//  FeedView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 26/05/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0 ... 10, id: \.self) { post in       
                            CarouselStoriesView()
                        }
                    }
                }
                .padding(8)
                
                if viewModel.isLoading {
                    ProgressView("Loading posts...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.posts) { post in
                            FeedCell(post: post)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo_black")
                        .resizable()
                        .frame(width: 100, height: 50)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchPosts()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModel())
    }
}
