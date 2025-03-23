//
//  UIEffect.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 21/03/25.
//

protocol UIEffect {}

enum BaseEffect: UIEffect {
    case navigate(destination: Destination)
}
