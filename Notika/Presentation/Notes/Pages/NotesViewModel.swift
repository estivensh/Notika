//
//  CounterViewModel.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Foundation
import Combine
import Inject

class NotesViewModel: ViewModel<NotesEvent, NotesState, NotesEffect> {
    
    
    @Inject private var notesUseCase: NotesUseCase

    init() {
        super.init(initialState: NotesState())
    }

    // Manejo de eventos
    override func handleEvent(_ event: NotesEvent) {
        switch event {
        case .addNote(let note):
            addNote(note)
        }
    }

    // Función privada para manejar el evento onGetUserById
    private func addNote(_ note: Note) {
        
        setState { state in
            var updatedState = state
            updatedState.isLoading = true
            return updatedState
        }
        
        notesUseCase.execute(note: note) { [weak self] result in
                   switch result {
                   case .success(let result):
                       DispatchQueue.main.async {
                           self?.setEffect(NotesEffect.showModal(message: "note added successfully!"))
                       }
                   case .failure(let error):
                       DispatchQueue.main.async {
                           self?.setEffect(.showModal(message: error.localizedDescription))
                       }
                   }
               }
        
        setState { state in
            var updatedState = state
            updatedState.isLoading = false
            return updatedState
        }
    }
}






