//
//  UsersApp.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import SwiftUI

@main
struct UsersApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }.background(Color(uiColor: .black))
            .ignoresSafeArea()
        }
    }
}
