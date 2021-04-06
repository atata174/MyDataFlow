//
//  DataManager.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 06.04.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let userDataKey = "userManager"
    
    private init() {}
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else {return}
        userDefaults.set(userData, forKey: userDataKey)
    }
    
    func loadUser() -> User{
        guard let userData = userDefaults.object(forKey: userDataKey) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userDefaults.removeObject(forKey: userDataKey)
    }
    
    
}
