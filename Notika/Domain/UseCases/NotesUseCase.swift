//
//  NotesUseCase.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import SwiftUI

public class NotesUseCase {
    private let repository: INotesRepository
    
    public init(repository: INotesRepository) {
        self.repository = repository
    }
    
    public func execute(note: Note, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.addNote(for: note, completion: completion)
    }
}
