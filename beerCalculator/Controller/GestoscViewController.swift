//
//  GestoscViewController.swift
//  beerCalculator
//
//  Created by Michał Massloch on 06/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import UIKit

class GestoscViewController: UIViewController {

    @IBOutlet weak var wynikGestosciLabel: UILabel!
    @IBOutlet weak var gestoscTextField: UITextField!
    @IBOutlet weak var temperaturaTextField: UITextField!
    
    let liczenieGestosci = GatunkiPiwa()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wynikGestosciLabel.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
        
    @IBAction func obliczButtonPressed(_ sender: UIButton) {
        let gestoscConv: Double? = Double(gestoscTextField.text!)
        let temperaturaConv: Double? = Double(temperaturaTextField.text!)
        if let safeGestosc = gestoscConv, let safeTemperatura = temperaturaConv {
            print(String(safeGestosc) + " " + String(safeTemperatura))
            let wynik = liczenieGestosci.korektaGestosci(gestosc: safeGestosc, temperatura: safeTemperatura)
            wynikGestosciLabel.text = String(format: "%.2f", wynik)
        }
    }
}
