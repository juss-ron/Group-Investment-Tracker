//
//  ProfileView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 21/10/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var user: User = User(username: "John Smith", email: "johnsmith@gmail.com", password: "Password47")
    @State private var passwordShown = false
    
    var body: some View {
        ScrollView {
            Image("ProfilePic")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.accent, lineWidth: 2))
            
            //MARK: User Details
            VStack {
                HStack {
                    Text("Name:")
                        .padding(.horizontal, 20)
                        .font(.title3)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                TextField("", text: $user.username)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                
                HStack {
                    Text("Email:")
                        .padding(.horizontal, 20)
                        .font(.title3)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                TextField("", text: $user.email)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                
                HStack {
                    Text("Password:")
                        .padding(.horizontal, 20)
                        .font(.title3)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                HStack {
                    if passwordShown {
                        TextField("", text: $user.password)
                    } else {
                        SecureField("", text: $user.password)
                    }
                    
                    Spacer()
                    Button {
                        passwordShown.toggle()
                    } label: {
                        Image(systemName: passwordShown ? "eye.fill" : "eye.slash.fill")
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .background(Color(.systemGray6))
                .frame(maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                .padding(.horizontal, 20)
                .padding(.bottom)
            }
            .padding()
            
            //MARK: Information
            VStack {
                HStack {
                    Text("Information:")
                        .padding(.horizontal, 20)
                        .font(.title2)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        VStack {
                            Text("Investment")
                                .padding(.bottom, 2)
                            Text("0")
                                .font(Font.title2.bold())
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        VStack {
                            Text("Interest")
                                .padding(.bottom, 2)
                            Text("0")
                                .font(Font.title2.bold())
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    }
                    
                    HStack {
                        Text("Total")
                            .font(Font.title)
                            .padding(10)
                        Spacer()
                        Text("0")
                            .font(Font.title2.bold())
                            .padding(10)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    .padding(.bottom, 10)
                    
                    HStack(spacing: 20) {
                        VStack {
                            Text("Owed")
                                .padding(.bottom, 2)
                            Text("0")
                                .font(Font.title2.bold())
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        VStack {
                            Text("In-Hand")
                                .padding(.bottom, 2)
                            Text("0")
                                .font(Font.title2.bold())
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    }
                    
                    HStack {
                        Text("Total")
                            .font(Font.title)
                            .padding(10)
                        Spacer()
                        Text("0")
                            .font(Font.title2.bold())
                            .padding(10)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                    
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
            }
            .padding()
            
            //MARK: Groups
            VStack {
                HStack {
                    Text("Groups:")
                        .padding(.horizontal, 20)
                        .font(.title2)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0...4, id: \.self) { _ in
                            VStack {
                                Text("ClubName")
                                    .padding(.bottom, 2)
                                Text("0")
                                    .font(Font.title2.bold())
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                            .frame(width: 150)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                            .padding(.leading, 20)
                            .padding(.vertical)
                        }
                    }
                }
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
            }
            .padding()
            
            //MARK: Theme
            VStack {
                HStack {
                    Text("Theme:")
                        .padding(.horizontal, 20)
                        .font(.title2)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                HStack(spacing: 20) {
                    VStack {
                        Color.white
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Light")
                    }
                    
                    VStack {
                        Color.black
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Dark")
                    }
                    
                    VStack {
                        ZStack {
                            Color.white
                            HStack {
                                Color.clear
                                Color.black
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("System")
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
            }
            .padding()
            
            //MARK: Accent Color
            VStack {
                HStack {
                    Text("Accent Color:")
                        .padding(.horizontal, 20)
                        .font(.title2)
                    
                    Spacer()
                }
                .fontWeight(.bold)
                
                HStack(spacing: 20) {
                    VStack {
                        Color.cyan
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Cyan")
                    }
                    
                    VStack {
                        Color.orange
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Orange")
                    }
                    
                    VStack {
                        Color.purple
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("Purple")
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
            }
            .padding()
        }
        .navigationTitle("Edit Profile")
    }
}

#Preview {
    ProfileView()
}
