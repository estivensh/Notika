//
//  Untitled.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//

import SwiftUI

struct AddNotePage: View {
    
    @State var title = ""
    @State var description = ""
    var color: Color
    
    var body: some View {
        ZStack {
            color.ignoresSafeArea()
            VStack {
                TextField("Enter your title", text: $title)
                    .fontWeight(.bold)
                               .disableAutocorrection(true)
                               .autocapitalization(.none)
                               .padding(8)
                               .font(.largeTitle)
                               .padding(.horizontal, 16)
                               .padding(.top, 40)
                
                TextField("Enter your body", text: $description)
                               .disableAutocorrection(true)
                               .autocapitalization(.none)
                               .padding(8)
                               .font(.body)
                               .padding(.horizontal, 16)
                
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    AddNotePage(color: .blue)
}
