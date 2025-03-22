//
//  CounterContract.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Foundation

protocol HomeContract {}

struct ProfileState: UIState {
    var isLoading: Bool = false
    var exception: Error? = nil
}

// Evento
enum ProfileEvent: UIEvent {
    case onGetUserById(userId: String)
}

// Efecto
enum ProfileEffect: UIEffect, Equatable {
    case navigate(to: Destination)
    case showModal(message: String)
}
