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
                
                TextField("Email", text: $user.email)
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
                                .textContentType(.password)
                                .font(Font.body.bold())
                        } else {
                            SecureField("Password", text: $user.password)
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
                NavigationLink("Forgot Password?") {
                    ForgotPasswordView()
                }
            }
            
            Button {
                verifyUser()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color("AccentColor"))
                    .overlay(Text("Sign In").foregroundColor(.white))
            }
            .padding(20)
            .padding(.horizontal, 10)
            
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
        verified = true
    }
}

#Preview {
    SignInView()
}
