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
    @State private var showColors = false
    @State private var animatedButton = false
    private var items: [Note]
    
    init(items: [Note]) {
        self.items = items
    }
    
    var body: some View {

            VStack {
                if profileViewModel.state.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    HStack {
                        if isMacOS() {
                            Sidebar(showColors: $showColors, animatedButton: $animatedButton){ color in 
                                profileViewModel.setEffect(.navigate(to: AnyView(AddNotePage(color: color))))
                            }
                            Rectangle()
                                .fill(.gray.opacity(0.15))
                                .frame(width: 1)
                        }
                        NavigationStack {
                            NoteListContent(notes: items)
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
                    #if os(macOS)
                    .ignoresSafeArea()
                    #endif
                    .frame(
                        width: isMacOS() ? getRect().width / 1.7 : nil,
                        height: isMacOS() ? getRect().height - 180 : nil,
                        alignment: .leading
                    )
                    .background(Color("BG")
                    .ignoresSafeArea())
                    #if os(iOS)
                    .overlay(Sidebar(showColors: $showColors, animatedButton: $animatedButton){ color in
                        profileViewModel.setEffect(.navigate(to: AnyView(AddNotePage(color: color))))
                    })
                    #endif
                    .preferredColorScheme(.light)
                    
                    /*Button("Add note") {
                        profileViewModel.setEvent(.addNote(note: .init(id: UUID(), title: "hola", body: "jjesje", color: "blue")))
                    }*/
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

#Preview {
    NotesListPage(items: [])
}




