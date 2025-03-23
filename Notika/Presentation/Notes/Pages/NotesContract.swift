//
//  CounterContract.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Foundation

protocol NotesContract {}

struct NotesState: UIState {
    var isLoading: Bool = false
    var exception: Error? = nil
}

enum NotesEvent: UIEvent {
    case addNote(note: Note)
}

enum NotesEffect: UIEffect, Equatable {
    case navigate(to: Destination)
    case showModal(message: String)
}
