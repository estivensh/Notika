//
//  ProfileScreen.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//
import SwiftUI

struct ProfileView: View {
    @StateObject private var profileViewModel = ProfileViewModel()
    
    // Recibir la respuesta del efecto
    @State private var showModal = false
    @State private var modalMessage = ""
    
    let userId: String
    
    var body: some View {
        VStack {
            if profileViewModel.state.isLoading {
                // Aquí podrías mostrar un loading spinner mientras se carga
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                // Aquí podrías mostrar el contenido de la pantalla
                Text("Profile Screen")
                    .font(.title)
                
                // Botón para cargar los datos del usuario
                Button("Load User Info") {
                    profileViewModel.setEvent(.onGetUserById(userId: userId))
          
                }
            }
        }
        .onAppear {
            // Aquí disparamos el evento cuando la vista aparece
            profileViewModel.setEvent(.onGetUserById(userId: userId))
        }
        .onChange(of: profileViewModel.effect) { effect in
            if let effect = effect {
                handleEffect(effect)
            }
        }
        .alert(isPresented: $showModal) {
            Alert(title: Text("Info"), message: Text(modalMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func handleEffect(_ effect: ProfileEffect) {
        switch effect {
        case .navigate(let destination):
            // Aquí manejarías la navegación
            print("Navigate to: \(destination)")
        case .showModal(let message):
            // Mostrar el modal con el mensaje
            modalMessage = message
            showModal = true
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: "123")
    }
}
