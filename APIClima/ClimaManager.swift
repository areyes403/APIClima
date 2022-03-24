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
            
            //let tarea = session.dataTask(with: url, completionHandler: controladorFinalizacion(datos:respuesta:error:))
            let tarea = session.dataTask(with: url){ datos, respuesta, error in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let datosSeguros = datos {
                    analizarJSON(datosClima:datosSeguros)
                }
                
            }
            tarea.resume()
        }
        
    }
    func analizarJSON(datosClima: Data){
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try decodificador.decode(DatosClima.self, from: datosClima)
            let condicionID = datosDecodificados.weather[0].id
            let nombreCiudad = datosDecodificados.name
            let temperatura = datosDecodificados.main.temp
            let humedad = datosDecodificados.main.humidity ?? 20
            
            var objClimaModelo = ClimaModelo(condicionID: condicionID, nombreCiudad: nombreCiudad, temperatura: temperatura)
            
        }catch{
            print(error)
        }
    }
    
}
