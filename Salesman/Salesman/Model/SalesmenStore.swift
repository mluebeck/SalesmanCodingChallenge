//
//  SalesmenStore.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation



public class SalesmenStore {
    var salesmen = [Salesman]()
    
    func getItems()->[Salesman] {
        return salesmen
    }
    
    func createADummySalesman() {
        let salesman = Salesman.createDefaultSalesman()
        self.addSalesman(salesman)
    }
    
    func addSalesman(_ value:Salesman ) {
        self.salesmen.append(value)
    }
    
    func addSalesmen(_ array:[Salesman]) {
        self.salesmen.append(contentsOf: array)
    }
    
    func filter(postcodeExpression:String)->[Salesman] {
        return [Salesman]()
    }
    
    static func createTestData() -> [Salesman] {
        var array = [Salesman]()
        array.append(Salesman(name: "Artem Titarenko", areas: ["76133"]))
        array.append(Salesman(name: "Bernd Schmitt", areas: ["7619*"]))
        array.append(Salesman(name: "Chris Krapp", areas: ["762*"]))
        array.append(Salesman(name: "Alex Uber", areas: ["86*"]))
        return array
    }
}
