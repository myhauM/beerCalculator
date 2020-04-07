//
//  NagazowanieViewController.swift
//  beerCalculator
//
//  Created by Michał Massloch on 06/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import UIKit

class NagazowanieViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var wybranyStylPiwa = ""
    var dolnaGranica: Float = 0.0
    var gornaGranica: Float = 0.0
    var stylePiwne = GatunkiPiwa()
    var surowiecIndex = 0
    
    @IBOutlet weak var surowiecSegmentedControl: UISegmentedControl!
    @IBOutlet weak var wynikNagazowanieLabel: UILabel!
    @IBOutlet weak var stylePickerView: UIPickerView!
    @IBOutlet weak var iloscDoPakowania: UITextField!
    @IBOutlet weak var temperaturaDoPakowania: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylePickerView.delegate = self
        stylePickerView.dataSource = self
        wynikNagazowanieLabel.text = ""
        surowiecIndexChanged(0)
    }
    
    @IBAction func surowiecIndexChanged(_ sender: Any) {
        surowiecIndex = surowiecSegmentedControl.selectedSegmentIndex
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stylePiwne.gatunki.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stylePiwne.gatunki[row].nazwaStylu
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = stylePiwne.gatunki[row].nazwaStylu
        let dolnaGranicaWybranego = stylePiwne.gatunki[row].dolnaGranicaNagazowania
        let gornaGranicaWybranego = stylePiwne.gatunki[row].gornaGranicaNagazowania
        stylePiwne.getBeerStyle(for: selected)
        wybranyStylPiwa = selected
        dolnaGranica = dolnaGranicaWybranego
        gornaGranica = gornaGranicaWybranego
    }
    
    @IBAction func obliczButtonPressed(_ sender: UIButton) {
        
        let iloscConv: Double? = Double(iloscDoPakowania.text!)
        let tempConv: Double? = Double(temperaturaDoPakowania.text!)
        
        if let safeIlosc = iloscConv, let safeTemp = tempConv {
            wynikNagazowanieLabel.text = stylePiwne.liczymyNagazowanie(surowiec: surowiecIndex, stylGora: gornaGranica, stylDol: dolnaGranica, ilosc: safeIlosc, temperatura: safeTemp)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
