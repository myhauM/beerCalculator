//
//  String+CommaToDot.swift
//  beerCalculator
//
//  Created by Michał Massloch on 10/04/2020.
//  Copyright © 2020 Michał Massloch. All rights reserved.
//

import Foundation

extension String {
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
}
