//
//  ViewModel.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

import Combine

protocol IViewModel: ObservableObject {
    associatedtype Event: UIEvent
    associatedtype State: UIState
    associatedtype Effect: UIEffect

    var state: CurrentValueSubject<State, Never> { get }
    var event: PassthroughSubject<Event, Never> { get }
    var effect: PassthroughSubject<Effect, Never> { get }

    func setEvent(_ event: Event)
}

class ViewModel<Event: UIEvent, State: UIState, Effect: UIEffect>: ObservableObject {
    @Published var state: State
    @Published var effect: Effect?

    init(initialState: State) {
        self.state = initialState
    }

    // Método para manejar eventos, que debe ser sobrescrito en los ViewModels concretos
    func handleEvent(_ event: Event) {
        fatalError("handleEvent should be implemented in subclass")
    }
    
    // Método para emitir efectos
    func setEffect(_ effect: @escaping () -> Effect) {
        self.effect = effect()
    }

    // Método para cambiar el estado
    func setState(_ update: @escaping (State) -> State) {
        self.state = update(self.state) // Aquí actualizamos el estado con el nuevo valor.
    }
    
    // Este método puede ser usado para despachar eventos
    func setEvent(_ event: Event) {
        handleEvent(event)  // Llama a la función handleEvent para manejar el evento
    }
}
