//
//  NotesRepositoryImpl.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import Foundation

public class NotesRepositoryImpl: INotesRepository {
   
    private let dataSource: NotesDataSource
    
    public init(dataSource: NotesDataSource) {
        self.dataSource = dataSource
    }
    
    public func addNote(for note: Note, completion: @escaping (Result<Void, any Error>) -> Void) {
        dataSource.addNote(for: note, completion: completion)
    }
}
