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
    
    var temperaturaString: String{
        return String(format: "%.1f", temperatura)
    }
    
    var nombreCondicion: String{
        switch condicionID{
        case 200...232:
            return "cloud.bolt"
        case 300...351:
            return "cloud.bolt.fill"
        case 400...451:
            return "cloud.bolt"
        case 500...551:
            return "cloud.bolt.fill"
        case 600...650:
            return "cloud.bolt"
        case 700...721:
            return "cloud.bolt.fill"
        case 800:
            return "cloud"
        case 801...831:
            return "cloud"
        default:
            return "cloud"
        }
    }
}
