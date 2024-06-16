//
//  AllShowFromHere.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct AllShowFromHere: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Show TabBarView")
                }
                .navigationBarBackButtonHidden()
                .padding(.bottom,40)
                
                NavigationLink {
                    StoriesView()
                } label: {
                    Text("Show StoriesView")
                }
                .navigationBarBackButtonHidden()
                .padding(.bottom,40)
            }
            .padding()
        }
    }
}

#Preview {
    AllShowFromHere()
}
