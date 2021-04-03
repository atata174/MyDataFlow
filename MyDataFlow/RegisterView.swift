//
//  RegisterView.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 03.04.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    @AppStorage("name") var name = ""
    var isCorrectName = false
    
    var body: some View {
        VStack {
            RegisterTextField(name: $name)
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }.disabled(name.count < 3 ? true : false)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
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
