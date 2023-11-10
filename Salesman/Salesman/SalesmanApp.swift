//
//  SalesmanApp.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import SalesmanModel
@main
struct SalesmanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel:SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData())))
        }
    }
}
