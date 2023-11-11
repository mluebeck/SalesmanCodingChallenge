//
//  SalesmanModelTests.swift
//  SalesmanModelTests
//
//  Created by Mario Rotz on 10.11.23.
//

import XCTest
@testable import SalesmanModel

final class SalesmanModelTests: XCTestCase {

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
        let testData = SalesmenStore.createTestDataForPlaceholderTests()
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
        let store = SalesmenStore().addSalesmen(SalesmenStore.createTestDataForPlaceholderTests())
        let storemen = store.filter(postcodePrefix:"76")
        XCTAssertTrue(storemen.count==4, "should find 4 storeman, found \(storemen.count)")
    }
    
    func test_SalesmenStore_filter_returns_3Storemen()throws {
        let store = SalesmenStore().addSalesmen(SalesmenStore.createTestDataForPlaceholderTests())
        let storemen = store.filter(postcodePrefix:"86")
        XCTAssertTrue(storemen.count==3, "should find 3 storeman, found \(storemen.count)")
    }
    
    func test_SalesmenStore_filter_returnsSuitableElements() throws {
        let store = SalesmenStore().addSalesmen(SalesmenStore.createTestDataForPlaceholderTests())
        let storemen = store.filter(postcodePrefix: "1")
        XCTAssertTrue(storemen.count==6, "should find zero storeman, found \(storemen.count)")

    }
    
    func test_SalesmenStore_filterWithInvalidParameter() throws {
        let store = SalesmenStore().addSalesmen(SalesmenStore.createTestDataForPlaceholderTests())
        var storemen = store.filter(postcodePrefix:"asdff")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression, found \(storemen.count)")
        storemen = store.filter(postcodePrefix:"1234567")
        XCTAssertTrue(storemen.count==0, "should find zero storeman because invalid expression,  found \(storemen.count)")
        storemen = store.filter(postcodePrefix:"")
        XCTAssertTrue(storemen.count==store.salesmen.count, "should find all storeman because empty expression,  found \(storemen.count)")
    }
    
    func test_filterWithPlaceholderInAreaList() throws {
        let store = SalesmenStore().addSalesmen(SalesmenStore.createTestDataForPlaceholderTests())
        let storemen = store.filter(postcodePrefix:"12345")
        XCTAssertEqual(storemen.count,6, "should find all storeman because all have 12345, either direct as number or als number with placeholder")
    }
    
    func test_salesmanSignatureAndZipcodes() throws {
        let salesMan = Salesman(name: "Mario Rotz", areas: ["01234","01235","12345"])
        XCTAssertTrue(salesMan.zipcodes==salesMan.areas.joined(separator: ", "))
        XCTAssertTrue(salesMan.signature == salesMan.name.prefix(1).uppercased())
    }
}
