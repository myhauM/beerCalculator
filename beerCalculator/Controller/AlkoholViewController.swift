//
//  AlkoholViewController.swift
//  beerCalculator
//
//  Created by Michał Massloch on 06/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import UIKit

class AlkoholViewController: UIViewController {

    let liczenieAlkoholu = GatunkiPiwa()
    
    @IBOutlet weak var wynikAlkoholuLabel: UILabel!
    
    @IBOutlet weak var gestoscPoczatkowa: UITextField!
    @IBOutlet weak var gestoscKoncowa: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        wynikAlkoholuLabel.text = ""
    }
    
    @IBAction func obliczButtonPressed(_ sender: UIButton) {
        let gestoscPoczatkowaConv: Double? = Double(gestoscPoczatkowa.text!)
        let gestoscKoncowaConv: Double? = Double(gestoscKoncowa.text!)
        if let safePoczatkowa = gestoscPoczatkowaConv, let safeKoncowa = gestoscKoncowaConv {
            let wynik = liczenieAlkoholu.liczenieAlkoholu(gestoscPoczatkowa: safePoczatkowa, gestoscKoncowa: safeKoncowa)
            wynikAlkoholuLabel.text = String(format: "%.2f", wynik) + ("%")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
 
}
