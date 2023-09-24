//
//  IOS_CW1App.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

@main
struct IOS_CW1App: App {
    @StateObject var userSessionManager = UserSessionManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSessionManager)
        }
    }
}
