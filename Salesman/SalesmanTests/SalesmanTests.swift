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
        store.addSalesmen(testData)
        let items = store.getItems()
        XCTAssertTrue(items.count==testData.count,"SalesmenStore getItems Method returns correct amount of test data")
        XCTAssertTrue(items[0].name == "Artem Titarenko", "SalesmenStore getItems Method returns correct first salesman")
        XCTAssertTrue(items[1].name == "Bernd Schmitt", "SalesmenStore getItems Method returns correct second salesman")
        XCTAssertTrue(items[2].name == "Chris Krapp", "SalesmenStore getItems Method returns correct third salesman")
        XCTAssertTrue(items[3].name == "Alex Uber", "SalesmenStore getItems Method returns correct fourth salesman")
        
        XCTAssertTrue(items[0].areas == ["76133"] && testData[0].areas==items[0].areas, "SalesmenStore getItems Method returns correct first areas")
        XCTAssertTrue(items[1].areas == ["7619*"] && testData[1].areas==items[1].areas, "SalesmenStore getItems Method returns correct second areas")
        XCTAssertTrue(items[2].areas == ["762*"] && testData[2].areas==items[2].areas, "SalesmenStore getItems Method returns correct third areas")
        XCTAssertTrue(items[3].areas == ["86*"] && testData[3].areas==items[3].areas, "SalesmenStore getItems Method returns correct fourth areas")
   
    }
    
    
     
}
