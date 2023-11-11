//
//  SnapshotTests.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 11.11.23.
//

import XCTest
import SwiftUI
import SalesmanModel
@testable import Salesman

final class SnapshotTests: XCTestCase {

    var viewController: UIViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let salesmanmodel = SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData()))
        let bookDetailView = ContentView(viewModel:salesmanmodel)
        viewController = UIHostingController(rootView: bookDetailView)
        viewController.setNeedsUpdateOfSupportedInterfaceOrientations()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }
    
    func testBookDetailViewOniPhone() throws {
        assert(snapshot: viewController.snapshot(for: .iPhone8(style: .light)), named: "IMAGE_COMMENTS_light")
    }

}
