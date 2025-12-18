//
//  WelcomeView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigate: Bool = false
    @State private var rotationDegrees: Double = 0
    
    var body: some View {
        NavigationStack() {
            VStack {
                Spacer()
                Spacer()
                
                LogoView()
                
                Text("Parity")
                    .font(Font.largeTitle.bold())
                
                Spacer()
                Spacer()
                Spacer()
                
                Circle()
                    .trim(from: 0.2, to: 0.8)
                    .stroke(Color("AccentColor"), lineWidth: 5)
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: rotationDegrees))
                    .onAppear {
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                            rotationDegrees = 360
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            navigate = true
                        }
                    }
                
                Spacer()
            }
            .navigationDestination(isPresented: $navigate) {
                SignInView()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
