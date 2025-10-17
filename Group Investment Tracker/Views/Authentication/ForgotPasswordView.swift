//
//  SignUpView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var emailSent: Bool = false
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    LogoView()
                    
                    Text("Enter the email adreess associate with your account")
                        .multilineTextAlignment(.center)
                        .font(Font.body.bold())
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .frame(height: 70)
                            .foregroundColor(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("AccentColor"), lineWidth: 1)
                            }
                        
                        TextField("Email", text: $email)
                            .font(Font.body.bold())
                            .padding()
                    }
                    
                    Button {
                        sendEmail()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color("AccentColor"))
                            .overlay(Text("Send code").foregroundColor(.white))
                    }
                    .padding(20)
                    .padding(.horizontal, 10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .navigationTitle("Forgot Password")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationDestination(isPresented: $emailSent) {
                VerifyEmailView()
            }
        }
    }
}



extension ForgotPasswordView {
    func sendEmail() {
        emailSent = true
    }
}




#Preview {
    ForgotPasswordView()
}

