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
    var clima = ClimaManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnSearch(_ sender: UIButton) {
        clima.obtenerClima(nombreCiudad: textFieldCiudad.text ?? "")
        print("hice una accion")
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("boton presionado")
        //print()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("termino de editar")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textFieldCiudad.text != ""{
            return true
        }else{
            print("Escribe el nombre de una ciudad")
            txtTexto.text="Escribe una ciudad porfavor"
            return false
        }
        
    }
  /*
extension ViewController: ClimaManagerDelegado{
        
        func actualizarClima(objClima: ClimaModelo){}
        
        func huboError(error: Error!){}
    }*/


}

