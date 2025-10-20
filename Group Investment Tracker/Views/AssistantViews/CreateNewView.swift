//
//  CreateNewView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 14/10/2025.
//

import SwiftUI

struct CreateNewView: View {
    var itemToCreate: ItemToCreate
    @State private var name: String = ""
    @State private var email: String = ""
    @Binding var clubs: [Club]?
    @Binding var members: [Member]?
    @Binding var isPresented: Bool
    
    
    var body: some View {
        VStack {
            Text(itemToCreate == .club ? "Create New Club" : "Create New Member")
                .font(Font.largeTitle)
            
            VStack {
                HStack {
                    Text("Name: ")
                    TextField("", text: $name)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal, 20)
                
                if itemToCreate == .member {
                    HStack {
                        Text("Email: ")
                        TextField("", text: $email)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.horizontal, 20)
                }
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
        guard !name.isEmpty else { return }
        if itemToCreate == .club {
            clubs!.append(Club(name: name))
        } else {
            guard verifyEmail(email) else { return }
            members!.append(Member(name: name, email: email))
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
    CreateNewView(itemToCreate: .member,clubs: .constant(nil), members: .constant([]), isPresented: .constant(true))
}
