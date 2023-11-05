//
//  ContentView.swift
//  Salesman
//
//  Created by Mario Rotz on 05.11.23.
//

import SwiftUI
import Combine 

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

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
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(0xefefef)) // Grauer Kreis
                                .overlay {
                                    Circle().stroke(Color(0xe3d5d5), lineWidth: 1)
                                }
                            Text(SalesManViewModel(salesman: item).capital)
                                .font(.custom("Roboto-Bold", size: 24))
                        }
                        .padding(.leading,-16)
                        .listRowBackground(Color.clear) // Deaktiviert die Hervorhebung der Zeile
                        VStack(alignment: .leading)  {
                            Text(SalesManViewModel(salesman: item).name)
                                .font(.custom("Roboto-Regular", size: 16))
                            Text(SalesManViewModel(salesman: item).zipcodes)
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
                        .frame(width: 10)
                       
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
                            
                            Text(SalesManViewModel(salesman: item).capital)
                                .font(.custom("Roboto-Bold", size: 24))
                        }
                        .padding(.leading,-16)
                        .listRowBackground(Color.clear) // Deaktiviert die Hervorhebung der Zeile
                        VStack {
                            Text(SalesManViewModel(salesman: item).name)
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
                        .frame(width: 10)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel:SalesmanListViewModel(salesmenStore:SalesmenStore().addSalesmen(SalesmenStore.createTestData())))
}

 
