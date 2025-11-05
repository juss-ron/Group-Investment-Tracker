//
//  SignIpView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var user = User(username: "", email: "", password: "")
    @State private var showPassword: Bool = false
    @State private var verified: Bool = false
    @AppStorage("token") var token = ""
    let service = AuthService()
    
    var body: some View {
        VStack(spacing: 20) {
            LogoView()
            
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .frame(height: 70)
                    .foregroundColor(Color(.systemGray6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("AccentColor"), lineWidth: 1)
                    }
                
                TextField("Username", text: $user.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .font(Font.body.bold())
                    .padding()
            }
            
            VStack(alignment: .trailing) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(height: 70)
                        .foregroundColor(Color(.systemGray6))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("AccentColor"), lineWidth: 1)
                        }
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $user.password)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .textContentType(.password)
                                .font(Font.body.bold())
                        } else {
                            SecureField("Password", text: $user.password)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .textContentType(.password)
                                .font(Font.body.bold())
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                        }
                        .foregroundStyle(.placeholder)
                    }
                    .padding()
                }
                validatePassword()
                NavigationLink("Forgot Password?") {
                    ForgotPasswordView()
                }
                .disabled(true)
            }
            
            Button {
                verifyUser()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color("AccentColor"))
                    .opacity(conditionsMet() ? 1 : 0.2)
                    .overlay(Text("Sign In").foregroundColor(.white))
            }
            .padding(20)
            .padding(.horizontal, 10)
            .disabled(!conditionsMet())
            
            HStack {
                Text("Don't have an account?")
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                }
                .foregroundStyle(Color("AccentColor"))
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $verified) {
            ClubsView()
        }
    }
}

extension SignInView {
    func verifyUser() {
        Task {
            do {
                let response = try await service.verifyUser(user)
                let message = response.message
                token = response.token ?? "No token"
                print(token)
                print(message)
                verified = true
            } catch {
                print("system fail: \(error)")
            }
        }
    }
    
    @ViewBuilder
    func validatePassword() -> some View {
        if user.password.count != 0 {
            if user.password.count < 8 {
                HStack {
                    Text("Password should be more than 8 charecters long")
                        .font(.footnote)
                        .foregroundStyle(.red)
                    
                    Spacer()
                }
            } else if !Validator.isPasswordValid(user.password) {
                HStack {
                    Text("Password must include letters, numbers, and special characters")
                        .font(.footnote)
                        .foregroundStyle(.red)
                    
                    Spacer()
                }
            }
        }
    }
    
    func conditionsMet() -> Bool {
        return Validator.isPasswordValid(user.password)// && user.username.count > 3
    }
}

#Preview {
    SignInView()
}
