//
//  UserManager.swift
//  MyDataFlow
//
//  Created by PenguinRaja on 03.04.2021.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegister = false
    @AppStorage("name") var name = ""
}
