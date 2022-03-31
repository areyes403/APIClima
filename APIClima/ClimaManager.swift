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
    //let climaURL="https://api.openweathermap.org/data/2.5/weather?"
    let climaURL="https://api.openweathermap.org/data/2.5/weather?&appid=4b919868c1c3d49dca4e11f89c04d5bc"
    //let apikey="4b919868c1c3d49dca4e11f89c04d5bc"
    var delegado: ClimaManagerDelegado?
    
    func obtenerClima(nombreCiudad: String){
      //  let urlString="\(climaURL)&q=\(nombreCiudad)&appid=\(apikey)"
        let urlString="\(climaURL)&q=\(nombreCiudad)"
        print(urlString)
        realizarSolicitud(urlString: urlString)
    }
    
    
    func realizarSolicitud(urlString: String){
        if let url=URL(string: urlString){
            //print("Llegue a hacer la solicitud de URL")
            let session=URLSession(configuration: .default)
            /*
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
 */
            let tarea = session.dataTask(with: url, completionHandler: manejador(datos:respuesta:error:))
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
    
    func manejador(datos: Data?, respuesta : URLResponse?, error: Error?) -> Void {
        print("Entre al manejador")
        if error != nil {
            print("Error")
            return
        }
        
        if let datosSeguros = datos {
            print("estoy en datos seguros")
            let datosString = String(data: datosSeguros, encoding: .utf8)
            print(datosString)
        }
    }
    
}
