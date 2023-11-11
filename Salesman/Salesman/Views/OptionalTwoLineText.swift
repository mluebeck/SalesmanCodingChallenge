//
//  OptionalTwoLineText.swift
//  Salesman
//
//  Created by Mario Rotz on 11.11.23.
//

import SwiftUI
import SalesmanModel

struct OptionalTwoLineText: View {
    var item : Salesman
    var isTwoLines : Bool
    var body: some View {
        VStack(alignment: .leading)  {
            Text(item.name)
                .font(.custom("Roboto-Regular", size: 16))
                .padding(.bottom,1)
        
            if isTwoLines {
                Text(item.zipcodes)
                    .foregroundColor(.gray)
                    .font(.custom("Roboto-Regular", size: 16))
            }
        }
    }
}

#Preview {
    OptionalTwoLineText(item:Salesman.createDefaultSalesman(), isTwoLines: false)
}
