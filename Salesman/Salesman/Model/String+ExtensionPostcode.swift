//
//  String+ExtensionPostcode.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import Foundation
extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

extension String {
    func isValidPostcodeExpression()->Bool {
        if self.count==0 || self.count>5 || self.starts(with: "00"){
            return false
        } else {
            var pattern = "[0-9]{5}"
            if self.count>0 && self.count<5 || (self.count==5 && self.last=="*"){
                pattern = "[0-9]{\(self.count-1)}[*]"
            }
            let regex = try! NSRegularExpression(pattern: pattern)
            let value =  regex.matches(self)
            return value
        }
    }
}
