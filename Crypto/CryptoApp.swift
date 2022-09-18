//
//  CryptoApp.swift
//  Crypto
//
//  Created by mac on 12/09/2022.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
