//
//  Salesman.swift
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
