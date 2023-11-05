//
//  SalesmanViewModel.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation


class SalesManViewModel {
    var name : String
    var zipcodes : String
    var capital : String {
        if name.count>0 {
            return String(name.prefix(1)).uppercased()
        } else {
            return " "
        }
    }
    
    init(name: String, zipcodes: String) {
        self.name = name
        self.zipcodes = zipcodes
    }
    
    init(salesman:Salesman) {
        self.name = salesman.name
        self.zipcodes = salesman.areas.joined(separator: " ")
    }
}
