//
//  ViewController.swift
//  APIClima
//
//  Created by mac17 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("boton presionado")
        //print()
        return true
    }


}

