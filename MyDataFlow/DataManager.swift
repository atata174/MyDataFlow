//
//  DataManager.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 06.04.2021.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("name") private var userData: Data?
    
    init() {}
    
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userData = nil
    }
}
