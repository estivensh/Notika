//
//  CardView.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//

import SwiftUI

struct CardView: View {
    
    var note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(isMacOS() ? .title3 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(.now, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 55)
        }
        .padding()
        .background(.red)
        .cornerRadius(18)
    }
}

#Preview {
    CardView(note: Note(id: .init(), title: "title", body: "ese", color: ""))
}
