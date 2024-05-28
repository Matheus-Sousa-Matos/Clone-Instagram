//
//  LoginView.swift
//  CloneInstagram
//
//  Created by Matheus de Sousa Matos on 27/05/24.
//

import SwiftUI

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("instagram_logo_black")
                    .resizable()
                    .frame(width: 220, height: 120)
                
                VStack {
                    TextField("Phone number, email or username", text: $login)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                                .font(.subheadline)
                        } else {
                            SecureField("Password", text: $password)
                                .font(.subheadline)
                        }
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(12)
                    .cornerRadius(8)
                    .background(
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .cornerRadius(8)
                    )
                    .padding(.horizontal, 24)
                }
                
                
                Button {
                    
                } label: {
                    Text("Forgot Passowrd?")
                        .foregroundColor(.blue)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 48)
                        .background(.blue)
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
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
                
                Button {
                    
                } label: {
                    Image("ic_facebook")
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .padding(.top, 8)
                
                Spacer()
                    
                Divider()
                
                NavigationLink {
                    RegisterView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
