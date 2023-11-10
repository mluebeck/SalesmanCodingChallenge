//
//  SalesmenStore.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation



public class SalesmenStore {
    
    public init() {}
    
    public var salesmen = [Salesman]()
    
    public func getItems()->[Salesman] {
        return salesmen
    }
    
    public func createADummySalesman() {
        let salesman = Salesman.createDefaultSalesman()
        self.addSalesman(salesman)
    }
    
    public func addSalesman(_ value:Salesman ) {
        self.salesmen.append(value)
    }
    
    public func addSalesmen(_ array:[Salesman])->SalesmenStore {
        self.salesmen.append(contentsOf: array)
        return self
    }
    
    public func filter(postcodePrefix:String)->[Salesman] {
        if postcodePrefix.count>5 || ( nil == Int(postcodePrefix) && postcodePrefix.count>0 ) {
            return []
        }
        var resultSalesmen = [Salesman]()
        self.salesmen.forEach {
            let result = $0.areas.filter {
                return $0.starts(with: postcodePrefix) || $0.postcodeIsMatching(to:postcodePrefix)
            }
            if result.count>0 {
                resultSalesmen.append($0)
            }
        }
        return resultSalesmen
    }
    
    public static func createTestDataForPlaceholderTests() -> [Salesman] {
        var array = [Salesman]()
        array.append(Salesman(name: "Artem Titarenko", areas: ["76133","75000","61000", "23613","12345"]))
        array.append(Salesman(name: "Bernd Schmitt", areas: ["7619*","1234*"]))
        array.append(Salesman(name: "Chris Krapp", areas: ["762*","123*"]))
        array.append(Salesman(name: "Alex Uber", areas: ["86*","12*"]))
        array.append(Salesman(name: "Mario Rotz", areas: ["86*","1*"]))
        array.append(Salesman(name: "Frauke Reiche", areas: ["86*","*"]))
        return array
    }
    
    public static func createTestData() -> [Salesman] {
        var array = [Salesman]()
        array.append(Salesman(name: "Artem Titarenko", areas: ["76133"]))
        array.append(Salesman(name: "Bernd Schmitt", areas: ["7619*"]))
        array.append(Salesman(name: "Chris Krapp", areas: ["762*"]))
        array.append(Salesman(name: "Alex Uber", areas: ["86*"]))
        return array
    }
}
