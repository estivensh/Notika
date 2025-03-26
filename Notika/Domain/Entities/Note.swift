//
//  Notes.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 23/03/25.
//

import SwiftData
import SwiftUI

@Model
final public class Note {
    
    @Attribute(.unique) public var id: UUID
    public var title: String
    public var body: String
    public var color: String
    
    public init(id: UUID, title: String, body: String, color: String) {
        self.id = id
        self.title = title
        self.body = body
        self.color = color
    }
}

