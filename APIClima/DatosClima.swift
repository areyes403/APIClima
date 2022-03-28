//
//  DatosClima.swift
//  APIClima
//
//  Created by mac17 on 24/03/22.
//

import Foundation

struct DatosClima: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    
    let descripcion: String
    let id: Int
}
