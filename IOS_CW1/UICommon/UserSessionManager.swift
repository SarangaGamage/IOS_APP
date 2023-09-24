//
//  UserSessionManager.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-24.
//

import SwiftUI

class UserSessionManager: ObservableObject {
    @Published var userEmail: String = ""

    func setUserEmail(_ email: String) {
        userEmail = email
    }
}
