//
//  SalesmanTests.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 05.11.23.
//

import XCTest
@testable import Salesman


final class PostcodeExpressionTests: XCTestCase {
    
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
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "1*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "100*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "12*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "123*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "1234*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "0000*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        postcode = "*"
        XCTAssertTrue(postcode.isValidPostcodeExpression(),"Postcode \(postcode) length should pass ")
        
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
    }
}

final class SalesmanTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SalesmenStoreExists() throws {
        let store = SalesmenStore()
        XCTAssertNotNil(store,"Store exists")
    }
    
    func test_SalesmenStore_getItems_returnsAnItem() throws {
        let store = SalesmenStore()
        store.createADummySalesman()
        let items = store.getItems()
        XCTAssertTrue(items.count==1,"Storemen getItems Method returns one item")
    }
    
    func test_SalesmenStore_getItems_returnsItems()throws {
        let store = SalesmenStore()
        let items = store.getItems()
        XCTAssertTrue(items.count>=0,"Storemen getItems Method returns zero or more items")
    }
    
    func test_SalesmenStore_returnsASalesmanObject()throws {
        let store = SalesmenStore()
        let dummySalesman = Salesman.createDefaultSalesman()
        store.createADummySalesman()
        let items = store.getItems()
        XCTAssertTrue(items.count==1 && items.first?.name == dummySalesman.name,"Storemen getItems Method returns a dummy salesman")
    }
    
    func test_SalesmenStore_generateAndReturnsTestData()throws {
        let store = SalesmenStore()
        let testData = SalesmenStore.createTestData()
        store.addSalesmen(testData)
        let items = store.getItems()
        XCTAssertTrue(items.count==testData.count,"SalesmenStore getItems Method returns correct amount of test data")
        XCTAssertTrue(items[0].name == testData[0].name && testData[0].name == "Artem Titarenko", "SalesmenStore getItems Method returns correct first salesman name")
        XCTAssertTrue(items[1].name == testData[1].name && testData[1].name == "Bernd Schmitt", "SalesmenStore getItems Method returns correct second salesman name")
        XCTAssertTrue(items[2].name == testData[2].name && testData[2].name == "Chris Krapp", "SalesmenStore getItems Method returns correct third salesman name")
        XCTAssertTrue(items[3].name == testData[3].name && testData[3].name == "Alex Uber", "SalesmenStore getItems Method returns correct fourth salesman name")
        
        XCTAssertTrue(items[0].areas == ["76133"] && testData[0].areas==items[0].areas, "SalesmenStore getItems Method returns correct first areas")
        XCTAssertTrue(items[1].areas == ["7619*"] && testData[1].areas==items[1].areas, "SalesmenStore getItems Method returns correct second areas")
        XCTAssertTrue(items[2].areas == ["762*"] && testData[2].areas==items[2].areas, "SalesmenStore getItems Method returns correct third areas")
        XCTAssertTrue(items[3].areas == ["86*"] && testData[3].areas==items[3].areas, "SalesmenStore getItems Method returns correct fourth areas")
        
    }
    
    
    func test_SalesmenStore_filter_returns_zeroOrMoreStoremen()throws {
        let store = self.makeSalesmenStoreUnderTest()
        let storemen = store.filter(postcodeExpression:"76133")
        XCTAssertTrue(storemen.count>=0, "find zero or more storeman")
    }
    
    func test_SalesmenStore_filterWithInvalidParameter() throws {
        let store = self.makeSalesmenStoreUnderTest()
        var storemen = store.filter(postcodeExpression:"asdff")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression")
        storemen = store.filter(postcodeExpression:"1234567")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression")
        storemen = store.filter(postcodeExpression:"")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression")
    }
     
    //MARK: Helper Methods
    
    private func makeSalesmenStoreUnderTest() -> SalesmenStore {
        let store = SalesmenStore()
        let testData = SalesmenStore.createTestData()
        store.addSalesmen(testData)
        return store
    }
    
}
