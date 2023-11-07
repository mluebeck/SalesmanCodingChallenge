//
//  ContentView.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine 



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
                    if viewModel.isExpanded(item: item)
                    {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(0xefefef))  
                                    .overlay {
                                        Circle().stroke(Color(0xe3d5d5), lineWidth: 1)
                                    }
                                Text(item.signature)
                                    .font(.custom("Roboto-Bold", size: 24))
                            }
                            .padding(.leading,-16)
                            .listRowBackground(Color.clear)
                            VStack(alignment: .leading)  {
                                Text(item.name)
                                    .font(.custom("Roboto-Regular", size: 16))
                                    .padding(.bottom,1)
                                Text(item.zipcodes)
                                    .foregroundColor(.gray)
                                    .font(.custom("Roboto-Regular", size: 16))
                            }
                            Spacer()
                            Button(action: {
                                viewModel.setNotExpanded(item: item)
                            })
                            {
                                Image("down")
                                    .resizable()
                                    .frame(width: 16, height: 10)
                                
                            }
                            .frame(width: 0)
                            
                        }
                    }
                    else {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(0xefefef)) // Grauer Kreis
                                    .overlay {
                                        Circle().stroke(Color(0xe3d5d5), lineWidth: 1)
                                    }
                                
                                Text(item.signature)
                                    .font(.custom("Roboto-Bold", size: 24))
                            }
                            .padding(.leading,-16)
                            .listRowBackground(Color.clear) // Deaktiviert die Hervorhebung der Zeile
                            VStack {
                                Text(item.name)
                                    .font(.custom("Roboto-Regular", size: 16))
                            }
                            Spacer()
                            Button(action: {
                                viewModel.setExpanded(item: item)
                            })
                            { Image("right")
                                    .resizable()
                                    .frame(width: 10, height: 16)
                                
                            }
                            .frame(width: 0)
                        }
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

 
