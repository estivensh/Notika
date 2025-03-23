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

    func handleEvent(_ event: Event) {
        fatalError("handleEvent should be implemented in subclass")
    }
    
    func setEffect(_ effect: Effect) {
        self.effect = effect
    }

    func setState(_ update: @escaping (State) -> State) {
        self.state = update(self.state)
    }
    
    func setEvent(_ event: Event) {
        handleEvent(event)
    }
}


