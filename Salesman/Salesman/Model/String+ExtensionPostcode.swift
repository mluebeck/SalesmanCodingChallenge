//
//  String+ExtensionPostcode.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation

extension String {
    func isValidPostcodeExpression()->Bool {
        if self.count>0 && self.count<=5 {
            return true
        }
        return false
    }
}
