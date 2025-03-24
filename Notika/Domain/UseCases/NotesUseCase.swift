//
//  NotesUseCase.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import SwiftUI
import Inject

public class NotesUseCase {
    
    @Singleton private var repository: INotesRepository
    
    public func execute(note: Note, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.addNote(for: note, completion: completion)
    }
}
