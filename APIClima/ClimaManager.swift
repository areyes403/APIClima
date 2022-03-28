//
//  ClimaManager.swift
//  APIClima
//
//  Created by mac17 on 23/03/22.
//

import Foundation


protocol ClimaManagerDelegado {
    func actualizarClima(objClima: ClimaModelo)
    func huboEror(error: Error)
}


struct ClimaManager {
    let climaURL=""
    var delegado: ClimaManagerDelegado?
    
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
                    //print(error?.localizedDescription)
                    delegado?.huboEror(error: error!)
                    return
                }
                
                if let datosSeguros = datos {
                    //analizarJSON(datosClima:datosSeguros)
                    if let objClima = analizarJSON(datosClima: datosSeguros){
                        delegado?.actualizarClima(objClima: objClima)
                    }
                }
                
            }
            tarea.resume()
        }
        
    }
    
    
    func analizarJSON(datosClima: Data) -> ClimaModelo? {
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try decodificador.decode(DatosClima.self, from: datosClima)
            let condicionID = datosDecodificados.weather[0].id
            let nombreCiudad = datosDecodificados.name
            let temperatura = datosDecodificados.main.temp
            //let humedad = datosDecodificados.main.humidity ?? 20
            
            var objClimaModelo = ClimaModelo(condicionID: condicionID, nombreCiudad: nombreCiudad, temperatura: temperatura)
            
            return objClimaModelo
            
        }catch{
            //print(error)
            delegado?.huboEror(error: error)
            return nil
        }
    }
    
}
