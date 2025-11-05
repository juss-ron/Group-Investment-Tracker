//
//  CreateNewView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 14/10/2025.
//

import SwiftUI

struct CreateNewView: View {
    var itemToCreate: ItemToCreate
    let clubService = ClubService()
    let memberService = MemberService()
    @State private var member: Member = Member(username: "", email: "")
    @State var club: Club = Club(title: "")
    @Binding var isPresented: Bool
    
    
    var body: some View {
        VStack {
            Text(itemToCreate == .club ? "Create New Club" : "Create New Member")
                .font(Font.largeTitle)
            
            VStack {
                HStack {
                    Text("Name: ")
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .frame(height: 50)
                            .foregroundColor(Color(.systemGray6))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("AccentColor"), lineWidth: 1)
                            }
                        
                        TextField("", text: itemToCreate == .club ? $club.title : $member.username)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .font(Font.body.bold())
                            .padding(.horizontal, 5)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            
            HStack {
                Spacer()
                Button {
                    cancel()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundStyle(.clear)
                        Text("Cancel")
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 2))
                Button {
                    createNewItem()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundStyle(.clear)
                        Text("Create")
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 2))
            }
            .padding(.horizontal, 20)
            .frame(height: 50)
        }
        .padding(20)
    }
}




enum ItemToCreate {
    case club, member
}

//Logic
extension CreateNewView {
    func cancel() {
        isPresented.toggle()
    }
    
    func createNewItem() {
        guard !member.username.isEmpty || !club.title.isEmpty else { return }
        if itemToCreate == .club {
            Task {
                do {
                    let response = try await clubService.create(club)
                    print(response.message)
                } catch {
                    print("Failed to create club: \(error)")
                }
            }
        } else {
            Task {
                do {
                    let response = try await memberService.add(member, to: club)
                    print(response.message)
                } catch {
                    print("Failed to create member: \(error)")
                }
            }
        }
        isPresented.toggle()
    }
    
    func verifyEmail(_ email: String) -> Bool {
        if email.hasSuffix("gmail.com") {
            return true
        }
        return false
    }
}

#Preview {
    CreateNewView(itemToCreate: .member, isPresented: .constant(true))
}
