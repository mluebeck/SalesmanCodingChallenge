//
//  ContentView.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine 

import SalesmanModel
 
public struct ContentView: View {
    
    @StateObject  public var viewModel : SalesmanListViewModel
    public var body: some View {
        NavigationView {
            
            VStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 24) // Adjust the padding as needed
                        .foregroundColor(.gray) // Adjust the color as needed
                    
                    TextField("Filtern", text: $viewModel.filterText)
                        .padding(.trailing, 24)
                        .padding(.leading, 0)
                        .border(.clear)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.bottom,10)
                .padding(.top,10)
                
                List(viewModel.filteredItems, id: \.self) { item in
                     HStack {
                        SignatureView(item: item)
                        OptionalTwoLineText(item: item, isTwoLines: viewModel.isExpanded(item: item))
                        Spacer()
                        ButtonView(viewModel: viewModel, item: item, expanded: viewModel.isExpanded(item: item))
                        .frame(width: 0)
                    }
                } // List
                .listStyle(.plain)
                .padding(.leading,16)
                .padding(.trailing,16)
            } // VStack
            .navigationBarTitle(
                Text("Adressen")
            )
        } // Navigation
    }
}

#Preview {
    ContentView(viewModel:SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData())))
}

 
