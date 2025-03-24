//
//  ContentView.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Note]
    

    
  
    var body: some View {
        // Llama a Dependencies dentro del body
        Dependencies(modelContext: modelContext)
        

        return ProfileView(items: items)
    }
}
