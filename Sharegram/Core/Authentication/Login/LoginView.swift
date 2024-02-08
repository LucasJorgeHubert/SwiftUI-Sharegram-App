//
//  LoginView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/06/23.
//

import SwiftUI
import PopupView

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(SGTextFieldModifier())
                    
                    SecureField("Password", text: $viewModel.password)
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
                    Task { try await viewModel.signIn() }
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
        .popup(isPresented: $viewModel.showErrorMessage) {
            ToastTopFirst(text: viewModel.errorMessage)
        } customize: {
            $0.position(.bottom)
                .type(.toast)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}