//
//  ViewController.swift
//  beerCalculator
//
//  Created by Michał Massloch on 02/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    //var gatunekPiwa = GatunkiPiwa()

    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }
    @IBAction func gestoscButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGestosc", sender: self)
    }
    
    @IBAction func nagazowanieButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNagazowanie", sender: self)
    }
    
    @IBAction func alkoholButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAlkohol", sender: self)
    }
}

