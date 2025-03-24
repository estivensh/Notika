//
//  CounterContract.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Foundation
import SwiftUI

protocol NotesContract {}

struct NotesListState: UIState {
    var isLoading: Bool = false
    var exception: Error? = nil
}

enum NotesListEvent: UIEvent {
    case addNote(note: Note)
}

enum NotesListEffect: UIEffect {
    case navigate(to: AnyView)
    case showModal(message: String)
    
    static func ==(lhs: NotesListEffect, rhs: NotesListEffect) -> Bool {
        switch (lhs, rhs) {
        case (.showModal(let message1), .showModal(let message2)):
            return message1 == message2
        case (.navigate, .navigate):
            return false
        default:
            return false
        }
    }
}
