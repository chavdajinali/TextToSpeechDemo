//
//  EventTask.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import Foundation

struct EventTask:Identifiable,Hashable {
    var id = UUID()
    var text :String
    var isCompleted = false
    var isNew = false
}
