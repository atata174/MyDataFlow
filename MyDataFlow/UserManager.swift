//
//  UserManager.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 03.04.2021.
//

import Combine

class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var isNameValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
    
}

struct User: Codable {
    var name = ""
    var isRegister = false
}
