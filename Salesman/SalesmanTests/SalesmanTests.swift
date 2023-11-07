//
//  SalesmanTests.swift
//  SalesmanTests
//
//  Created by Mario Rotz on 05.11.23.
//

import XCTest
import SwiftUI

@testable import Salesman


final class SalesmanSnapshotTests: XCTestCase {
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
extension XCTestCase {
    
    func assert(snapshot: UIImage, named name: String, file: StaticString = #filePath, line: UInt = #line) {
        let snapshotURL = makeSnapshotURL(named: name, file: file)
        let snapshotData = makeSnapshotData(for: snapshot, file: file, line: line)

        guard let storedSnapshotData = try? Data(contentsOf: snapshotURL) else {
            XCTFail("Failed to load stored snapshot at URL: \(snapshotURL). Use the `record` method to store a snapshot before asserting.", file: file, line: line)
            return
        }
        
        if snapshotData != storedSnapshotData {
            let temporarySnapshotURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
                .appendingPathComponent(snapshotURL.lastPathComponent)
            
            try? snapshotData?.write(to: temporarySnapshotURL)
            
            XCTFail("New snapshot does not match stored snapshot. New snapshot URL: \(temporarySnapshotURL), Stored snapshot URL: \(snapshotURL)", file: file, line: line)
        }
    }
    
    func record(snapshot: UIImage, named name: String, file: StaticString = #filePath, line: UInt = #line) {
        let snapshotURL = makeSnapshotURL(named: name, file: file)
        let snapshotData = makeSnapshotData(for: snapshot, file: file, line: line)
        do {
            try FileManager.default.createDirectory(
                at: snapshotURL.deletingLastPathComponent(),
                withIntermediateDirectories: true
            )
            try snapshotData?.write(to: snapshotURL)
            XCTFail("Record succeeded - use `assert` to compare the snapshot from now on.", file: file, line: line)
        } catch {
            XCTFail("Failed to record snapshot with error: \(error)", file: file, line: line)
        }
    }
    
    private func makeSnapshotURL(named name: String, file: StaticString) -> URL {
        return URL(fileURLWithPath: String(describing: file))
            .deletingLastPathComponent()
            .appendingPathComponent("snapshots")
            .appendingPathComponent("\(name).png")
    }
    
    private func makeSnapshotData(for snapshot: UIImage, file: StaticString, line: UInt) -> Data? {
        guard let data = snapshot.pngData() else {
            XCTFail("Failed to generate PNG data representation from snapshot", file: file, line: line)
            return nil
        }
        return data
    }
}

extension UIViewController {
    func snapshot(for configuration: SnapshotConfiguration) -> UIImage {
        return SnapshotWindow(configuration: configuration, root: self).snapshot()
    }
}

struct SnapshotConfiguration {
    let size: CGSize
    let safeAreaInsets: UIEdgeInsets
    let layoutMargins: UIEdgeInsets
    let traitCollection: UITraitCollection
    
    static func iPhone8(style: UIUserInterfaceStyle, contentSize: UIContentSizeCategory = .medium) -> SnapshotConfiguration {
        return SnapshotConfiguration(
            size: CGSize(width: 375, height: 667),
            safeAreaInsets: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            layoutMargins: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
            traitCollection: UITraitCollection(traitsFrom: [
                .init(forceTouchCapability: .available),
                .init(layoutDirection: .leftToRight),
                .init(preferredContentSizeCategory: contentSize),
                .init(userInterfaceIdiom: .phone),
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(displayScale: 2),
                .init(displayGamut: .P3),
                .init(userInterfaceStyle: style)
            ]))
    }
}

private final class SnapshotWindow: UIWindow {
    private var configuration: SnapshotConfiguration = .iPhone8(style: .light)
    
    convenience init(configuration: SnapshotConfiguration, root: UIViewController) {
        self.init(frame: CGRect(origin: .zero, size: configuration.size))
        self.configuration = configuration
        self.layoutMargins = configuration.layoutMargins
        self.rootViewController = root
        self.isHidden = false
        root.view.layoutMargins = configuration.layoutMargins
    }
    
    override var safeAreaInsets: UIEdgeInsets {
        return configuration.safeAreaInsets
    }
    
    override var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [super.traitCollection, configuration.traitCollection])
    }

    func snapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: .init(for: traitCollection))
        return renderer.image { action in
            layer.render(in: action.cgContext)
        }
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

