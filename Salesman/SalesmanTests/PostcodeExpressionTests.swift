//
//  Postcode.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 05.11.23.
//

import XCTest

final class PostcodeExpressionTests: XCTestCase {
    
    func test_postcodeIsMatching() throws {
        var postcode = "123*"
        var postcode2 = "12345"
        XCTAssertTrue(postcode.postcodeIsMatching(to: postcode2),"\(postcode) is equal to \(postcode2) ")
        
        postcode = "12345"
        postcode2 = "123*"
        XCTAssertTrue(postcode.postcodeIsMatching(to: postcode2),"\(postcode) is equal to \(postcode2) ")
        
        postcode = "12*"
        postcode2 = "345"
        XCTAssertFalse(postcode.postcodeIsMatching(to: postcode2),"\(postcode) is not equal to \(postcode2) ")

        postcode = "*"
        postcode2 = "345"
        XCTAssertTrue(postcode.postcodeIsMatching(to: postcode2),"\(postcode) is equal to \(postcode2) ")

        postcode = "3*"
        postcode2 = "345"
        XCTAssertTrue(postcode.postcodeIsMatching(to: postcode2),"\(postcode) is equal to \(postcode2) ")
    }
    
    func test_postcodeExpressionLengthIsValid() throws {
        var postcode = "12345"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "123456"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should fail ")
        postcode = "1234567"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should fail ")
        postcode = "123*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "12*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "1*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = ""
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should fail ")
    }
        
    func test_postcodeExpressionIsValid() throws {
        var postcode = "12345"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "0*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "1*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "100*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "12*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "123*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "1234*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
        postcode = "*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should pass ")
    }
        
    func test_postcodeExpressionIsInvalid() throws {
        var postcode = "abcde"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "abc*"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail")
        postcode = "12**"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = ""
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "*123"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "*abc"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "23345*"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "2334**"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "**"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "00"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "00123"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "0012*"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "00*"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) valuation should fail ")
        postcode = "0000*"
        XCTAssertFalse(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
    }
}
