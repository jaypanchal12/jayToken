//
//  Tokenization_DemoApp.swift
//  Tokenization Demo
//
//  Created by jay prakash on 16/09/2024.
//

import SwiftUI

@main
struct Tokenization_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                SignUpView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
