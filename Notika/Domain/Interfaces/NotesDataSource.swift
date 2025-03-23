//
//  NotesDataSource.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import Foundation

public protocol NotesDataSource {
    func addNote(for note: Note, completion: @escaping (Result<Void, Error>) -> Void)
}
