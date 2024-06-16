//
//  StoriesView.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(story:story,pageIndex:0)
        }
    }
}

#Preview {
    StoriesView()
}
