//
//  UploadPostView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 29/05/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var imagePickerPresented: Bool = false
    @StateObject var viewModel: UploadPostViewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    viewModel.clearData()
                    tabIndex = 0
                } label: {
                    Image(systemName: "chevron.backward")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()

            }
            .padding(.horizontal)
            
            // post image and caption
            VStack(spacing: 12) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 250)
                        .cornerRadius(18)
                        .clipped()
                }
                TextField("Write a caption or add a poll..", text: $viewModel.caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
            
            Divider()
            
            Button {
                Task {
                    try await viewModel.uploadPost()
                    viewModel.clearData()
                    tabIndex = 0
                }
            } label: {
                Text("Share")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 48)
                    .background(.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical)
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
