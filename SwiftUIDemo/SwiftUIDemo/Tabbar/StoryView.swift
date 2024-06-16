//
//  StoryView.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Text(information.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
        .padding([.top,.bottom],50)
    }
}

#Preview {
    StoryView()
}
