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
            HStack {
                Image(systemName: "magnifyingglass")
                .padding(.leading, 24) // Adjust the padding as needed
                .foregroundColor(.gray) // Adjust the color as needed

                TextField("Filtern", text: $viewModel.filterText)
                    .padding(.trailing, 24)
                    .border(.clear)
                    .textFieldStyle(.automatic)
                 
            }
            .padding(.bottom,10)
            .padding(.top,10)
            
            List(viewModel.filteredItems, id: \.self) { item in
                if viewModel.isExpanded(item: item)
                {
                    HStack {
                        Text(SalesManViewModel(salesman: item).capital)
                        
                        VStack {
                            Text(SalesManViewModel(salesman: item).name)
                            Text(SalesManViewModel(salesman: item).zipcodes)
                        }
                        Button(action: {
                            viewModel.setNotExpanded(item: item)
                        }) {
                            Text("Toggle 1 Zeile")
                        }
                    }
                }
                else {
                    HStack {
                        Text(SalesManViewModel(salesman: item).capital)
                        Text(SalesManViewModel(salesman: item).name)
                        Button(action: {
                            viewModel.setExpanded(item: item)
                        }) {
                            Text("Toggle 2 Zeilen")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel:SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData())))
}

 
