//
//  NotesRepositoryImpl.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import Foundation
import Inject

public class NotesRepositoryImpl: INotesRepository {
   
    @Inject private var dataSource: NotesDataSource
    
    
    
    public func addNote(for note: Note, completion: @escaping (Result<Void, any Error>) -> Void) {
        dataSource.addNote(for: note, completion: completion)
    }
}
