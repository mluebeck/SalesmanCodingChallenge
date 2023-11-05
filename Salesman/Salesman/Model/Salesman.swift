//
//  Salesman.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation
public class Salesman : Hashable,   Equatable {
    public static func == (lhs: Salesman, rhs: Salesman) -> Bool {
        return lhs.name == rhs.name && lhs.areas == rhs.areas
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
    
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
