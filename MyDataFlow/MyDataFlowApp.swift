//
//  MyDataFlowApp.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 02.04.2021.
//

import SwiftUI

@main
struct MyDataFlowApp: App {
//    @StateObject private var user = UserManager() // version with StateObject
    private let user = DataManager.shared.loadUser() // withoutStateObject
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
