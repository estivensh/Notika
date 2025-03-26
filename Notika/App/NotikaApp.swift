//
//  NotikaApp.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import SwiftUI
import SwiftData

@main
struct NotikaApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Note.self])
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
