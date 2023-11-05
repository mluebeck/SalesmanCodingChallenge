//
//  SalesmanListViewModel.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine


class SalesmanListViewModel: ObservableObject {
    @Published var filterText = ""
    @Published var filteredItems: [Salesman] = [Salesman]()
    var salesmenStore : SalesmenStore
    
    private var cancellable: AnyCancellable?

    init(salesmenStore:SalesmenStore) {
        self.salesmenStore = salesmenStore
        self.filteredItems = salesmenStore.getItems()
        cancellable = $filterText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.filterItems()
            }
    }

    func filterItems() {
        if filterText.isEmpty {
            filteredItems = salesmenStore.salesmen
        } else {
            filteredItems = salesmenStore.filter(postcodeExpression: filterText)
        }
    }

}
