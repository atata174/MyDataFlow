//
//  RegisterView.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 03.04.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }
        }
    }
    
    private func registerUser() {
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
