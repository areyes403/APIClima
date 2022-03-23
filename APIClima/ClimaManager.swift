//
//  ClimaManager.swift
//  APIClima
//
//  Created by mac17 on 23/03/22.
//

import Foundation

struct ClimaManager {
    let climaURL=""
    
    func obtenerClima(nombreCiudad: String){
        let urlString="\(climaURL)&q=\(nombreCiudad)"
        
        print(urlString)
        realizarSolicitud(urlString: urlString)
    }
    func realizarSolicitud(urlString: String){
        if let url=URL(string: urlString){
            let session=URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url, completionHandler: controladorFinalizacion(datos:respuesta:error:))
            tarea.resume()
        }
    }
    
    func controladorFinalizacion(datos:Data?, respuesta:URLResponse?, error:Error?){
        if error != nil {
            print(error?.localizedDescription)
            return
        }
        
        if let datosSeguros = datos {
            let datosString = String(data: datosSeguros, encoding: .utf8)
            print(datosString ?? "no hubo datos")
        }
    }}
