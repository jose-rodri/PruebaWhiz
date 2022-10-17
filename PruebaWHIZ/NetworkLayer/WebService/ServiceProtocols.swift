//
//  ServiceProtocols.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 5/05/22.
//

import Foundation

protocol ServiceEnum {}

protocol Networking {
    associatedtype EnumType: ServiceEnum
    static func getService(from type: EnumType) -> Requestable
}
