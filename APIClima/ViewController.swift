//
//  ViewController.swift
//  APIClima
//
//  Created by mac17 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    
    @IBOutlet weak var txtfCiudad: UITextField!
    @IBOutlet weak var txtTemperatura: UILabel!
    @IBOutlet weak var btnBuscar: UIButton!
    @IBOutlet weak var imgIcono: UIImageView!
    @IBOutlet weak var txtTexto: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("boton presionado")
        //print()
        return true
    }
    
extension ViewController: ClimaManagerDelegado{
        
        func actualizarClima(objClima: ClimaModelo){}
        
        func huboError(error: Error!){}
    }


}

