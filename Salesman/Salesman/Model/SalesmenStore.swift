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
    
    func addSalesmen(_ array:[Salesman])->SalesmenStore {
        self.salesmen.append(contentsOf: array)
        return self
    }
    
    func filter(postcodeExpression:String)->[Salesman] {
        if postcodeExpression.count>5 || ( nil == Int(postcodeExpression) && postcodeExpression.count>0 ) {
            return []
        }
        var resultSalesmen = [Salesman]()
        self.salesmen.forEach {
            let result = $0.areas.filter {
                return $0.starts(with: postcodeExpression) || $0.postcodeIsEqual(to:postcodeExpression)
            }
            if result.count>0 {
                resultSalesmen.append($0)
            }
        }
        return resultSalesmen
    }
    
    static func createTestData() -> [Salesman] {
        var array = [Salesman]()
        array.append(Salesman(name: "Artem Titarenko", areas: ["76133","75000","61000", "23613"]))
        array.append(Salesman(name: "Bernd Schmitt", areas: ["7619*"]))
        array.append(Salesman(name: "Chris Krapp", areas: ["762*"]))
        array.append(Salesman(name: "Alex Uber", areas: ["86*"]))
        return array
    }
}
