//
//  NotesRepository.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import SwiftUI

public protocol INotesRepository {
    func addNote(for note: Note, completion: @escaping (Result<Void, Error>) -> Void)
}
