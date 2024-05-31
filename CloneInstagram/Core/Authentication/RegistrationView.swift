//
//  RegistrationView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 27/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("instagram_logo_black")
                .resizable()
                .frame(width: 220, height: 120)
            
            Text("Sign up to see photos and videos\nfrom your friends.")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button {
                
            } label: {
                HStack {
                    Image("ic_facebook")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text("Log in with Facebook")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: 360, height: 48)
                .background(.blue)
                .cornerRadius(8)
            }
            .padding(.top)
            
            HStack {
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                
                Text("OR")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            }
            .foregroundColor(.gray)
            .padding(.vertical)
            
            Group {
                TextField("Email", text: $viewModel.email)
                TextField("Full name", text: $viewModel.fullname)
                TextField("Username", text: $viewModel.username)
                SecureField(text: $viewModel.password) {
                    Text("Password")
                }
            }
            .font(.subheadline)
            .autocapitalization(.none)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 24)
            
            
            Spacer()
            
            VStack(spacing: 8) {
                Text("People who use our service may have uploaded your contact information to instagram. [Learn More](https://www.google.com/?client=safari)")
                .font(.footnote)
                .foregroundColor(.gray)
                .tint(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                            
                Text("By signing up, you agree to our [Terms, Privacy Policy](https://www.google.com/?client=safari) and [Cookies Policy.](https://www.google.com/?client=safari)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .tint(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }
            
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 48)
                    .background(.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Divider()
            
            Button {
                self.dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Have an account?")
                        .foregroundColor(.black)
                    
                    Text("Log in")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(RegistrationViewModel())
    }
}
