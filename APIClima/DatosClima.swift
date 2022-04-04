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
    let base: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    
}

struct Weather: Decodable {
    
    let description: String
    let id: Int
}
