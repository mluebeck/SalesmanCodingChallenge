//
//  ContentView.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine 

 

struct ContentView: View {
    
    @StateObject var viewModel : SalesmanListViewModel 
    var body: some View {
        VStack {
            TextField("Filtern", text: $viewModel.filterText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(viewModel.filteredItems, id: \.self) { item in
                HStack {
                    Text(SalesManViewModel(salesman: item).capital)
                    VStack {
                        Text(SalesManViewModel(salesman: item).name)
                        Text(SalesManViewModel(salesman: item).zipcodes)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel:SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData())))
}

 
