//
//  MyDataFlowApp.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 02.04.2021.
//

import SwiftUI

@main
struct MyDataFlowApp: App {
    
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
