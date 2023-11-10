//
//  ContentView.swift
//  SampleApp
//
//  Created by Mario Rotz on 10.11.23.
//

import SwiftUI
import Sample

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(HelloWorld().print())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
