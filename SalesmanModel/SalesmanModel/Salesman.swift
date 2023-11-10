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
        hasher.combine(self.name + self.zipcodes)
    }
    
    public var name : String
    public var areas : [String]
    
    public init(name: String, areas: [String]) {
        self.name = name
        self.areas = areas
    }
    
    public var zipcodes : String {
        return self.areas.joined(separator: ", ")
    }
    
    public var signature : String {
        if name.count>0 {
            return String(name.prefix(1)).uppercased()
        } else {
            return " "
        }
    }
    
    public static func createDefaultSalesman() -> Salesman {
        return Salesman(name: "Vorname Nachname", areas: [])
    }
}
