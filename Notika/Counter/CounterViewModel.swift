//
//  CounterViewModel.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Foundation
import Combine

class ProfileViewModel: ViewModel<ProfileEvent, ProfileState, ProfileEffect> {

    init() {
        super.init(initialState: ProfileState()) // Llamamos al inicializador de la clase base
    }

    // Manejo de eventos
    override func handleEvent(_ event: ProfileEvent) {
        switch event {
        case .onGetUserById(let userId):
            getUserById(userId)
        }
    }

    // Función privada para manejar el evento onGetUserById
    private func getUserById(_ userId: String) {
        // Simulando una operación de carga de datos (sin backend por ahora)
        setState { state in
            var updatedState = state
            updatedState.isLoading = true  // Marcamos que se está cargando
            return updatedState
        }
        
        // Simulando la carga del usuario, después de 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setState { state in
                var updatedState = state
                updatedState.isLoading = false  // Ya no estamos cargando
                return updatedState
            }
            
            // Aquí emitiríamos un efecto de mostrar un modal
            self.setEffect {
                ProfileEffect.showModal(message: "User \(userId) loaded successfully!")
            }
        }
    }
}




