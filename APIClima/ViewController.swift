//
//  ViewController.swift
//  APIClima
//
//  Created by mac17 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    
    //@IBOutlet weak var txtfCiudad: UITextField!
    @IBOutlet weak var txtTemperatura: UILabel!
    @IBOutlet weak var textFieldCiudad: UITextField!
    @IBOutlet weak var imgIcono: UIImageView!
    @IBOutlet weak var txtTexto: UILabel!
    var climaManager = ClimaManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldCiudad.delegate = self
        
    }
    
    @IBAction func btnSearch(_ sender: UIButton) {
        textFieldCiudad.endEditing(true)
        //climaManager.obtenerClima(nombreCiudad: textFieldCiudad.text ?? "")
        print(textFieldCiudad.text)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("boton presionado")
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
  /*
extension ViewController: ClimaManagerDelegado{
        
        func actualizarClima(objClima: ClimaModelo){}
        
        func huboError(error: Error!){}
    }*/


}

