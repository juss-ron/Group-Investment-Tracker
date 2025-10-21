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
    
    var body: some View {
        NavigationStack {
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
                            .font(Font.body.bold())
                            .padding()
                    }
                    
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
                            .overlay(Text("Sign Up").foregroundColor(.white))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $accountCreated) {
                ClubsView()
            }
        }
    }
}



extension SignUpView {
    func createUser() {
        accountCreated = true
    }
}




#Preview {
    SignUpView()
}
