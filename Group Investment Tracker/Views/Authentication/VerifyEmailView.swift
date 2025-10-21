//
//  SignUpView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct VerifyEmailView: View {
    @State private var verified: Bool = false
    @State private var code: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            LogoView()
            
            Text("Please enter the four digit code that was sent to your email address.")
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
                
                TextField("4-Digit Code", text: $code)
                    .font(Font.body.bold())
                    .padding()
            }
            
            Button {
                verify()
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
        .navigationDestination(isPresented: $verified) {
            ResetPasswordView()
        }
    }
}

extension VerifyEmailView {
    func verify() {
        verified = true
    }
}

#Preview {
    VerifyEmailView()
}

