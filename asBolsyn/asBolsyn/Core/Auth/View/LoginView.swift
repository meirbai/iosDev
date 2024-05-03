//
//  LoginView.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        NavigationStack{
            Image("Image")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height:120)
                .padding(.vertical, 32)
            
            VStack(spacing: 24)
            {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                
                InputView(text: $password, title: "Password", placeholder:"Enter password", isSecureField: true)
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            Button {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
            } label: {
                HStack {
                    Text ("SIGN IN" )
                        .fontWeight(.semibold)
                    Image (systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame (width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text ("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
