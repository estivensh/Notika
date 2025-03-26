//
//  Sidebar.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//

import SwiftUI

struct Sidebar: View {
    
    @Binding var showColors: Bool
    @Binding var animatedButton: Bool
    var buttonAdded: (Color) -> Void
 
    var body: some View {
        VStack {
            
            if isMacOS(){
                Text("Notika")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            if isMacOS() {
                AddButton(showColors: $showColors, animateButton: $animatedButton)
                    .zIndex(1)
            }
            
            VStack(spacing: 15) {
                let colors: [Color] = [
                    Color.green,
                    Color.blue
                ]
                
                ForEach(colors, id: \.self){ color in
                    Circle()
                        .fill(color)
                        .frame(width: isMacOS() ? 20 : 25, height: isMacOS() ? 20 : 25)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                                self.showColors.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                withAnimation(.spring()){
                                    animatedButton.toggle()
                                }
                            }
                            buttonAdded(color)
                        }
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
            
            if !isMacOS() {
                AddButton(showColors: $showColors, animateButton: $animatedButton)
                    .zIndex(1)
            }
        }
        #if os (macOS)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        #else
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:
            .bottomTrailing)
        .padding()
        .background(BlurView(style: .systemUltraThinMaterialDark)
            .opacity(showColors ? 1 : 0)
            .ignoresSafeArea())
        #endif
    }
}

#Preview {
    Sidebar(showColors: .constant(false), animatedButton: .constant(false)){ color in
        
    }
}
