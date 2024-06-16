//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
           HomeView()
                .tabItem { Label("Home", systemImage: "person") }
            StoryView()
                .tabItem { Label("Story", systemImage: "book") }
            FaviteView()
                .tabItem { Label("Favorite", systemImage: "star") }
            FunFactsView()
                .tabItem { Label("Fun Facts", systemImage: "hand.thumbsup") }
        }
    }
}

#Preview {
    ContentView()
}
