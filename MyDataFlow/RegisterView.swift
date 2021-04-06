//
//  RegisterView.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 03.04.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            RegisterTextField(name: $user.user.name)
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }.disabled(!user.isNameValid)
        }
    }
    
    private func registerUser() {
        if !user.user.name.isEmpty {
            DataManager.shared.saveUser(user: user.user)
            user.user.isRegister.toggle()
        }
    }
}

struct RegisterTextField: View {
    @Binding var name: String
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
                .offset(x: 20, y: 0)
            Text("\(name.count)")
                .foregroundColor(name.count < 3 ? .red : .green)
                .offset(x: -20, y: 0)
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
