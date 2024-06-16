//
//  FunFactsView.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct FunFactsView: View {
    @State private var funFact = ""
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 200)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        
        .padding()
    }
}

#Preview {
    FunFactsView()
}
