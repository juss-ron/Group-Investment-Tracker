//
//  SignUpView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var passwordConfirmation: String = ""
    @State private var showPasswordConfirmation: Bool = false
    @State private var complete: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                LogoView()
                
                Text("Your new password must be different from your previous password.")
                    .multilineTextAlignment(.center)
                    .font(Font.body.bold())
                
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
                            TextField("Password", text: $password)
                                .textContentType(.password)
                                .font(Font.body.bold())
                        } else {
                            SecureField("Password", text: $password)
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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(height: 70)
                        .foregroundColor(Color(.systemGray6))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("AccentColor"), lineWidth: 1)
                        }
                    
                    HStack {
                        Group {
                            if showPasswordConfirmation {
                                TextField("Confirm Password", text: $passwordConfirmation)
                            } else {
                                SecureField("Confirm Password", text: $passwordConfirmation)
                            }
                        }
                        .textContentType(.password)
                        .font(Font.body.bold())
                        
                        Button {
                            showPasswordConfirmation.toggle()
                        } label: {
                            Image(systemName: showPasswordConfirmation ? "eye.slash.fill" : "eye.fill")
                        }
                        .foregroundStyle(.placeholder)
                    }
                    .padding()
                }
                
                Button {
                    reset()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 50)
                        .foregroundColor(Color("AccentColor"))
                        .overlay(Text("Verify").foregroundColor(.white))
                }
                .padding(20)
                .padding(.horizontal, 10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .navigationTitle("Email Verification")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $complete) {
                ClubsView()
            }
        }
    }
}


extension ResetPasswordView {
    func reset() {
        complete = true
    }
}




#Preview {
    ResetPasswordView()
}
