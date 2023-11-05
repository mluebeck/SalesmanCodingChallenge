//
//  SalesmanTests.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 05.11.23.
//

import XCTest
@testable import Salesman



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
        let _ = store.addSalesmen(testData)
        let items = store.getItems()
        XCTAssertTrue(items.count==testData.count,"SalesmenStore getItems Method returns correct amount of test data")
        XCTAssertTrue(items[0].name == testData[0].name && testData[0].name == "Artem Titarenko", "SalesmenStore getItems Method returns correct first salesman name")
        XCTAssertTrue(items[1].name == testData[1].name && testData[1].name == "Bernd Schmitt", "SalesmenStore getItems Method returns correct second salesman name")
        XCTAssertTrue(items[2].name == testData[2].name && testData[2].name == "Chris Krapp", "SalesmenStore getItems Method returns correct third salesman name")
        XCTAssertTrue(items[3].name == testData[3].name && testData[3].name == "Alex Uber", "SalesmenStore getItems Method returns correct fourth salesman name")
        
        XCTAssertTrue(items[0].areas == testData[0].areas && testData[0].areas==items[0].areas, "SalesmenStore getItems Method returns correct first areas")
        XCTAssertTrue(items[1].areas == testData[1].areas && testData[1].areas==items[1].areas, "SalesmenStore getItems Method returns correct second areas")
        XCTAssertTrue(items[2].areas == testData[2].areas && testData[2].areas==items[2].areas, "SalesmenStore getItems Method returns correct third areas")
        XCTAssertTrue(items[3].areas == testData[3].areas && testData[3].areas==items[3].areas, "SalesmenStore getItems Method returns correct fourth areas")
        
    }
    
    func test_SalesmenStore_filter_returns_4Storemen()throws {
        let store = self.makeSalesmenStoreUnderTest()
        let storemen = store.filter(postcodeExpression:"76")
        XCTAssertTrue(storemen.count==3, "should find 3 storeman, found \(storemen.count)")
    }
    
    func test_SalesmenStore_filter_returns_1Storemen()throws {
        let store = self.makeSalesmenStoreUnderTest()
        let storemen = store.filter(postcodeExpression:"86")
        XCTAssertTrue(storemen.count==1, "should find 1 storeman, found \(storemen.count)")
    }
    
    func test_SalesmenStore_filter_returnsSuitableElements() throws {
        let store = self.makeSalesmenStoreUnderTest()
        let storemen = store.filter(postcodeExpression: "1")
        XCTAssertTrue(storemen.count==0, "find zero   storeman")

    }
    
    func test_SalesmenStore_filterWithInvalidParameter() throws {
        let store = self.makeSalesmenStoreUnderTest()
        var storemen = store.filter(postcodeExpression:"asdff")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression")
        storemen = store.filter(postcodeExpression:"1234567")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression")
        storemen = store.filter(postcodeExpression:"")
        XCTAssertTrue(storemen.count==store.salesmen.count, "should find all storeman because empty expression")
    }
    
    //MARK: Helper Methods
    
    private func makeSalesmenStoreUnderTest() -> SalesmenStore {
        let store = SalesmenStore()
        let testData = SalesmenStore.createTestData()
        let _ = store.addSalesmen(testData)
        return store
    }
}

