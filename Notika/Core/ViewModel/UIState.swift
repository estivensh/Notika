//
//  UIState.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

protocol UIState {}

protocol BaseState: UIState {
    var isLoading: Bool { get }
    var error: Error? { get }
}
