//
//  StoryModels.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import Foundation

struct Story {
    let pages: [StoryPage]
    
    subscript(_ pageIndex : Int) -> StoryPage {
        return pages[pageIndex]
    }
    
}

struct StoryPage {
    let text : String
    
    let choices:[Choice]
    
    init(text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
    
}

struct Choice {
    let text: String
    let destination: Int
}
