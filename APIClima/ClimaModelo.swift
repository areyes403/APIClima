//
//  ClimaModelo.swift
//  APIClima
//
//  Created by mac17 on 24/03/22.
//

import Foundation


struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let temperatura: Double
    let description: String
    let maxima: Double
    let minima: Double
    
    var temperaturaString: String{
        return String(format: "%.1f", temperatura)
    }
    
    var nombreCondicion: String{
        switch condicionID{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.bolt.fill"
        case 500...531:
            return "cloud.sleet"
        case 600...622:
            return "snow"
        case 700...781:
            return "sun.dust"
        case 800:
            return "sun.max"
        case 801...831:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
}
