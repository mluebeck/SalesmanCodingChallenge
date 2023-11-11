//
//  SignatureView.swift
//  Salesman
//
//  Created by Mario Rotz on 11.11.23.
//

import SwiftUI
import SalesmanModel

struct SignatureView: View {
    var item : Salesman
    public var body: some View {
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
    }
}

#Preview {
    SignatureView(item:Salesman(name: "Test", areas: ["12345"]))
}
