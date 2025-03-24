//
//  Dependencies.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import Inject
import SwiftData

func Dependencies(modelContext: ModelContext) {

    @Provides var notesDataSource: () -> NotesDataSource = { LocalNotesDataSource(modelContext: modelContext) }
    @Provides var useCase = { NotesUseCase() }

    // ViewModels
    @Provides var artDetailViewModel = { NotesListViewModel() }
    
    // Singletons
    @Singleton var repository: INotesRepository = NotesRepositoryImpl()
}
