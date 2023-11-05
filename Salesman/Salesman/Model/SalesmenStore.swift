//
//  SalesmenStore.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation

public class SalesmenStore {
    var salesmen = [String]()
    
    func getItems()->[String] {
        return ["a value"]
    }
    
    func createADummySalesman() {
        let salesman = "A Salesman"
        self.addSalesman(salesman)
    }
    
    func addSalesman(_ value:String ) {
        self.salesmen.append(value)
    }
}
