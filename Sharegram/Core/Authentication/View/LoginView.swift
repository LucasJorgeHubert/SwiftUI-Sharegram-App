//
//  LoginView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/06/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - Top Space
                Spacer()
                
                // MARK: - Logo
                Image("SharegramLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                
                // MARK: - Text Fields
                VStack {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .modifier(SGTextFieldModifier())
                    
                    SecureField("Password", text: $password)
                        .modifier(SGTextFieldModifier())
                }
                
                // MARK: - Action Buttons
                Button {
                    print("forget pass")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemIndigo).opacity(0.8))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("SignUp")
                            .fontWeight(.bold)
                    }
                }

            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
