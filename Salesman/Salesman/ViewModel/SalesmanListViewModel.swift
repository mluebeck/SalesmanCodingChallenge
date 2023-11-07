//
//  SalesmanListViewModel.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine


public class SalesmanListViewModel: ObservableObject {
    @Published var filterText = ""
    @Published var filteredItems: [Salesman] = [Salesman]()
    @Published var expandedDict = [Salesman : Bool]()

    var salesmenStore : SalesmenStore
    private var cancellable: AnyCancellable?
    
    public init(salesmenStore:SalesmenStore) {
        self.salesmenStore = salesmenStore
        self.filteredItems = salesmenStore.getItems()
        cancellable = $filterText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.filterItems()
            }
    }
    func isExpanded(item:Salesman) -> Bool {
        if let item = self.expandedDict[item] {
            return item
        } else {
            return false
        }
    }
    
    func setExpanded(item:Salesman) {
        self.expandedDict[item] = true
    }
    
    func setNotExpanded(item:Salesman) {
        self.expandedDict[item] = false
    }
    
    func filterItems() {
        if filterText.isEmpty {
            filteredItems = salesmenStore.salesmen
        } else {
            filteredItems = salesmenStore.filter(postcodePrefix: filterText)
        }
    }
}
