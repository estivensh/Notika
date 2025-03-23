//
//  LocalNotesDataSource.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import Foundation
import SwiftData

public class LocalNotesDataSource: NotesDataSource {
    private var modelContext: ModelContext
    
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    public func addNote(for note: Note, completion: @escaping (Result<Void, any Error>) -> Void) {
        let insert: () = modelContext.insert(note)
        completion(.success(insert))
    }
}
