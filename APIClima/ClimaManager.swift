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
    
    let climaURL="https://api.openweathermap.org/data/2.5/weather?&appid=4b919868c1c3d49dca4e11f89c04d5bc&units=metric"
    var delegado: ClimaManagerDelegado?
    
   // var delegado:ClimaManagerDelegado?
    
    func obtenerClima(nombreCiudad: String){
        let urlString="\(climaURL)&q=\(nombreCiudad)"
        print(urlString)
        realizarSolicitud(urlString: urlString)
    }
    
    
    func realizarSolicitud(urlString: String){
        if let url=URL(string: urlString){
            let session=URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { (datos, respuesta, error) in
                if error != nil {
                    print("Error al obtener los datos")
                    return
                }
                
                if let datosSeguros = datos {
                    //parsear JSON
                    if let objClima = self.parsearJSON(datosClima: datosSeguros){
                        //let ClimaVC = ViewController()
                        //ClimaVC.actualizarClima(objclima: objC)
                        self.delegado?.actualizarClima(objClima: objClima)
                    }
                    
                }
            }
            tarea.resume()
        }
        
    }
    
    func parsearJSON(datosClima: Data) -> ClimaModelo? {
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode(DatosClima.self, from: datosClima)
            let condicionID = datosDecodificados.weather[0].id
            let descripcion = datosDecodificados.weather[0].description
            let nombreCiudad = datosDecodificados.name
            let temperatura = datosDecodificados.main.temp
            
            let objClima = ClimaModelo (condicionID: condicionID, nombreCiudad: nombreCiudad, temperatura: temperatura, description: descripcion)
            
            return objClima
            
        } catch {
            print("Error al decodificar"+error.localizedDescription)
            return nil
        }
        
        
    }
    /*
    func analizarJSON(datosClima: Data) -> ClimaModelo? {
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try decodificador.decode(DatosClima.self, from: datosClima)
            let condicionID = datosDecodificados.weather[0].id
            let nombreCiudad = datosDecodificados.name
            let temperatura = datosDecodificados.main.temp
            //let humedad = datosDecodificados.main.humidity ?? 20
            print ("La ciudad que buscaste es: " + nombreCiudad)
            var objClimaModelo = ClimaModelo(condicionID: condicionID, nombreCiudad: nombreCiudad, temperatura: temperatura)
            //print(objClimaModelo.nombreCondicion)
            return objClimaModelo
            
        }catch{
            //print(error)
            delegado?.huboEror(error: error)
            return nil
        }
    }*/
    
    
    
}
