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
        let localDataSource = LocalNotesDataSource(modelContext: modelContext)
        let repository = NotesRepositoryImpl(dataSource: localDataSource)
        let fetchWeatherUseCase = NotesUseCase(repository: repository)
        let viewModel = NotesViewModel(notesUseCase: fetchWeatherUseCase)
        
        ProfileView(viewModel: viewModel, items: items)
    }
}
