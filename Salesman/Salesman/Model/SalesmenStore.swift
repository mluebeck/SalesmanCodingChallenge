//
//  SalesmenStore.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation

public class Salesman {
    var name : String
    var areas : [String]
    
    init(name: String, areas: [String]) {
        self.name = name
        self.areas = areas
    }
    
    static func createDefaultSalesman() -> Salesman {
        return Salesman(name: "Vorname Nachname", areas: [])
    }
}

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
    
    static func createTestData() -> [Salesman] {
        var array = [Salesman]()
        array.append(Salesman(name: "Artem Titarenko", areas: ["76133"]))
        array.append(Salesman(name: "Bernd Schmitt", areas: ["7619*"]))
        array.append(Salesman(name: "Chris Krapp", areas: ["762*"]))
        array.append(Salesman(name: "Alex Uber", areas: ["86*"]))
        return array
    }
}
