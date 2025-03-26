//
//  AddButton.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//
import SwiftUI

struct AddButton: View {
    
    @Binding var showColors: Bool
    @Binding var animateButton: Bool
    
    var body: some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                self.showColors.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.spring()){
                    animateButton.toggle()
                }
            }
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .scaleEffect(animateButton ? 1.1 : 1)
                .padding(isMacOS() ? 12 : 15)
                .background(.black)
                .clipShape(Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0))
        .scaleEffect(animateButton ? 1.1 : 1)
    }
}

#Preview {
    AddButton(showColors:.constant(false), animateButton: .constant(false))
}
