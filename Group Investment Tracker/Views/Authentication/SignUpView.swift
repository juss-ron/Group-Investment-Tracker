//
//  SignUpView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var user = User(username: "", email: "", password: "")
    @State private var showPassword: Bool = false
    @State private var accountCreated: Bool = false
    let service = AuthService()
    @AppStorage("token") var token: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            LogoView()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
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
            validateUsername()
            
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .frame(height: 70)
                    .foregroundColor(Color(.systemGray6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("AccentColor"), lineWidth: 1)
                    }
                
                TextField("Email", text: $user.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .font(Font.body.bold())
                    .padding()
            }
            validateEmail()
            
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
            
            HStack {
                Text("Already have an account?")
                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                }
                .foregroundStyle(Color("AccentColor"))
            }
            .padding(20)
            .padding(.bottom, 10)
            
            Button {
                createUser()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color("AccentColor"))
                    .opacity(conditionsMet() ? 1 : 0.2)
                    .overlay(Text("Sign Up").foregroundColor(.white))
            }
            .disabled(!conditionsMet())
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $accountCreated) {
            ClubsView()
        }
    }
}

extension SignUpView {
    func createUser() {
        Task {
            do {
                let response = try await service.createUser(user)
                let message = response.message
                token = response.token ?? "No token"
                print(message)
                accountCreated = true
            } catch {
                print("Failed to create account: \(error)")
            }
        }
    }
    
    @ViewBuilder
    func validateUsername() -> some View {
        if user.username.count != 0 {
            if user.username.count < 4 || user.username.count > 15 {
                HStack {
                    Text("Username should be between 4 and 15 characters")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .padding(.top, -15)
                    
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    func validateEmail() -> some View {
        if user.email.count > 0 && !Validator.isEmailValid(user.email) {
            HStack {
                Text("Enter a valid email adress")
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .padding(.top, -15)
                
                Spacer()
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
                        .padding(.top, -15)
                    
                    Spacer()
                }
            } else if !Validator.isPasswordValid(user.password) {
                HStack {
                    Text("Password must include letters, numbers, and special characters")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .padding(.top, -10)
                    
                    Spacer()
                }
            }
        }
    }
    
    func conditionsMet() -> Bool {
        return Validator.isEmailValid(user.email) && Validator.isPasswordValid(user.password) && user.username.count > 3 && user.username.count < 16
    }
    
    
}

#Preview {
    SignUpView()
}
