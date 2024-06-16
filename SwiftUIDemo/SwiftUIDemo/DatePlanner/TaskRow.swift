//
//  TaskRow.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct TaskRow: View {
    
    @Binding var task:EventTask
    var isEditing : Bool
    @FocusState private var isFocused:Bool
    
    var body: some View {
        HStack {
            Button{
                task.isCompleted.toggle()
            }label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            if isEditing || task.isNew {
                TextField("Task description" , text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
            }else{
                Text(task.text)
            }
            
            Spacer()
            
        }
        .padding(.vertical,10)
        .task {
            if task.isNew {
                isFocused = true
            }
        }
    }
}

//#Preview {
//    TaskRow()
//}
