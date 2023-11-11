//
//  ButtonView.swift
//  Salesman
//
//  Created by Mario Rotz on 11.11.23.
//

import SwiftUI
import SalesmanModel

struct ButtonView: View {
    var viewModel: SalesmanListViewModel
    var item : Salesman
    var expanded : Bool
    var body: some View {
        if expanded {
            Button(action: {
                viewModel.setNotExpanded(item: item)
            })
            {
                Image("down")
                    .resizable()
                    .frame(width: 16, height: 10)
                
            }
        } else {
            Button(action: {
                viewModel.setExpanded(item: item)
            })
            { Image("right")
                    .resizable()
                    .frame(width: 10, height: 16)
                
            }
        }
    }
}

