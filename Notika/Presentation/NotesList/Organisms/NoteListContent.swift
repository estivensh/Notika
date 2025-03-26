//
//  NoteListContent.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//

import SwiftUI

struct NoteListContent: View {
    
    var notes: [Note]
    
    var body: some View {
        VStack(spacing: 6){
        
            VStack(spacing: 15){
                Text("Notes")
                    .font(isMacOS() ? .system(size: 33, weight: .bold) : .largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS() ? 25: 15), count: isMacOS() ? 3 : 1)
                
                LazyVGrid(columns: columns, spacing: 25){
                    ForEach(notes){ note in
                        CardView(note: note)
                    }
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, isMacOS() ? 10 : 15)
            .padding(.horizontal, 25)
    }
}

#Preview {
    NoteListContent(notes: [])
}
