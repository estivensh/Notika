//
//  ProfileScreen.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//
import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @StateObject private var profileViewModel: NotesViewModel
    private var items: [Note]
    
    init(viewModel: NotesViewModel, items: [Note]) {
        _profileViewModel = StateObject(wrappedValue: viewModel)
        self.items = items
    }
    
    @State private var showModal = false
    @State private var modalMessage = ""
 

    
    var body: some View {
        VStack {
            if profileViewModel.state.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                List {
                    ForEach(items){ item in
                        Text("Hola \(item.title)")
                    }
                }
                
                Button("Add note") {
                    profileViewModel.setEvent(.addNote(note: .init(id: UUID(),title: "hola", body: "jjesje", color: "blue")))
                }
            }
        }
        .onReceive(profileViewModel.$effect) { newEffect in
            if let effect = newEffect {
                handleEffect(effect)
            }
        }
        .alert(isPresented: $showModal) {
            Alert(title: Text("Info"), message: Text(modalMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func handleEffect(_ effect: NotesEffect) {
        switch effect {
        case .navigate(let destination):
            print("Navigate to: \(destination)")
        case .showModal(let message):
            modalMessage = message
            showModal = true
        }
    }
}


