//
//  GatunkiPiwa.swift
//  beerCalculator
//
//  Created by Michał Massloch on 02/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import Foundation

struct GatunkiPiwa {
    var wyborZPickera = 0
    let gatunki = [
        GatunekPiwa(nazwaStylu: "Brytyjskie ale", dolnaGranicaNagazowania: 2.1, gornaGranicaNagazowania: 2.6),
        GatunekPiwa(nazwaStylu: "Porter, Stout", dolnaGranicaNagazowania: 1.2, gornaGranicaNagazowania: 2.1),
        GatunekPiwa(nazwaStylu: "Belgijskie ale", dolnaGranicaNagazowania: 1.9, gornaGranicaNagazowania: 2.4),
        GatunekPiwa(nazwaStylu: "Amerykańskie ale, Lagery", dolnaGranicaNagazowania: 2.2, gornaGranicaNagazowania: 2.7),
        GatunekPiwa(nazwaStylu: "Niemieckie pszczeniczne", dolnaGranicaNagazowania: 3.2, gornaGranicaNagazowania: 3.6)
    ]
    func getBeerStyle(for nazwa: String) {
       
    }
    
    func korektaGestosci(gestosc: Double, temperatura: Double) -> Double {
        let wspolczynnik = 0.075
        let wynik = ((temperatura-20)*wspolczynnik)+gestosc
        return wynik
    }
    
    func liczenieAlkoholu(gestoscPoczatkowa: Double, gestoscKoncowa: Double) -> Double {
        return ((gestoscPoczatkowa-gestoscKoncowa)/1.938)
    }
    
    func liczymyNagazowanie (surowiec: Int, stylGora: Float, stylDol: Float, ilosc: Double, temperatura: Double) -> String {
        var masaCukru = 0
        if surowiec == 0 {
            masaCukru = 180
        }
        else if surowiec == 1 {
            masaCukru = 342
        }
        let rV = pow(0.97,temperatura)
        let aVDol = Double(stylDol)-rV
        let aVGora = Double(stylGora)-rV
        let co2_l_dol = aVDol*ilosc
        let co2_l_gora = aVGora*ilosc
        let co2_mol_dol = co2_l_dol/22.4
        let co2_mol_gora = co2_l_gora/22.4
        let cukier_mol_dol = co2_mol_dol/2
        let cukier_mol_gora = co2_mol_gora/2
        let cukierMinimum = String(format:"%.1f",cukier_mol_dol*Double(masaCukru))
        let cukierMaksimum = String(format:"%.1f",cukier_mol_gora*Double(masaCukru))
        let wynik = "\(cukierMinimum)g - \(cukierMaksimum)g"
        return wynik
    }
    
    
}
