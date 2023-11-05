//
//  SalesmanViewModelTest.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 05.11.23.
//

import XCTest


final class SalesmanViewModelTests: XCTestCase {
    func test_SalesmenViewModel() throws {
        let salesMan = Salesman(name: "Mario Rotz", areas: ["01234","01235","12345"])
        let salesManViewModel = SalesManViewModel(salesman: salesMan)
        XCTAssertTrue(salesManViewModel.name==salesMan.name, "Name should match ")
        XCTAssertTrue(salesManViewModel.zipcodes==salesMan.areas.joined(separator: " "))
        XCTAssertTrue(salesManViewModel.capital == salesMan.name.prefix(1).uppercased())
    }
}
