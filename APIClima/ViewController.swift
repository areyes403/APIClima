//
//  ViewController.swift
//  APIClima
//
//  Created by mac17 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegado{
    func actualizarClima(objClima: ClimaModelo) {
        DispatchQueue.main.async {
            self.txtTemperatura.text = String(objClima.temperatura)
            self.txtTexto.text = "\(objClima.nombreCiudad) its \(objClima.description)"
            self.imgIcono.image = UIImage(systemName: objClima.nombreCondicion)
            self.txtMin.text = "Temp Min: \(String(objClima.minima))"
            self.txtMax.text = "Temp Max: \(String(objClima.maxima))"
            
            switch objClima.condicionID{
            case 200...232:
                self.imgBackgroung.image = UIImage(named: "2thunderstorm")
            case 300...321:
                self.imgBackgroung.image = UIImage(named: "3drizzle")
            case 500...531:
                self.imgBackgroung.image = UIImage(named: "5rain")
            case 600...622:
                self.imgBackgroung.image = UIImage(named: "6snow")
            case 700...781:
                self.imgBackgroung.image = UIImage(named: "7atmosphere")
            case 800:
                self.imgBackgroung.image = UIImage(named: "8clear")
            case 801...831:
                self.imgBackgroung.image = UIImage(named: "81clouds")
            default:
                return self.imgBackgroung.image = UIImage(named: "8clear")
            }
            
        }
    }
    
    func huboEror(error: Error) {
        
    }
    
    
    
    //@IBOutlet weak var txtfCiudad: UITextField!
    @IBOutlet weak var txtTemperatura: UILabel!
    @IBOutlet weak var textFieldCiudad: UITextField!
    @IBOutlet weak var imgIcono: UIImageView!
    @IBOutlet weak var txtTexto: UILabel!
    @IBOutlet weak var imgBackgroung: UIImageView!
    @IBOutlet weak var txtMin: UILabel!
    @IBOutlet weak var txtMax: UILabel!
    var climaManager = ClimaManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        climaManager.delegado = self
        textFieldCiudad.delegate = self
        
        
    }
    
    @IBAction func btnSearch(_ sender: UIButton) {
        textFieldCiudad.endEditing(true)
        //climaManager.obtenerClima(nombreCiudad: textFieldCiudad.text ?? "")
       // print(textFieldCiudad.text)
        //textFieldCiudad.placeholder = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // print("boton presionado")
        textFieldCiudad.endEditing(true)
        //print()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        climaManager.obtenerClima(nombreCiudad: textFieldCiudad.text!)
        //print("termino de editar")
        textFieldCiudad.placeholder = ""
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textFieldCiudad.text != ""{
            return true
        }else{
            //print("Escribe el nombre de una ciudad")
            textFieldCiudad.placeholder = "Escribe una ciudad porfavor"
            return false
        }
        
    }

   
    

}

