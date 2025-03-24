//
//  ProfileScreen.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//
import SwiftUI

struct NotesListPage: View {
    
    @StateObject private var profileViewModel: NotesListViewModel = NotesListViewModel()
    @State private var destinationView: AnyView? = nil
    @State private var showModal = false
    @State private var modalMessage = ""
    private var items: [Note]
    
    init(items: [Note]) {
        self.items = items
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if profileViewModel.state.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List {
                        ForEach(items) { item in
                            Text("Hola \(item.title)")
                        }
                    }
                    
                    Button("Add note") {
                        profileViewModel.setEvent(.addNote(note: .init(id: UUID(), title: "hola", body: "jjesje", color: "blue")))
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
            .navigationDestination(isPresented: Binding(
                        get: { destinationView != nil },
                        set: { if !$0 { destinationView = nil } }
                    )) {
                        if let destination = destinationView {
                            destination
                        }
                    }
        }
    }
    
    private func handleEffect(_ effect: NotesListEffect) {
        switch effect {
        case .navigate(let destination):
            destinationView = destination
        case .showModal(let message):
            modalMessage = message
            showModal = true
        }
    }
}



