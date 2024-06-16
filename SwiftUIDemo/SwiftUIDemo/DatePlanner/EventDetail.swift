//
//  EventDetail.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct EventDetail: View {
    
    @Binding var event:Event
    var isEditing:Bool
    
    @State private var isPickingSymbol = false
    
    var body: some View {
        List {
            
            HStack {
                Button {
                    isPickingSymbol.toggle()
                }label: {
                    Image(systemName: event.symbol)
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(event.color)
                        .opacity(isEditing ? 0.3 : 1)
                }
                .buttonStyle(.plain)
                .padding(.horizontal,5)
                
                if isEditing {
                    TextField("New Event",text: $event.title)
                        .font(.title2)
                }else{
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            
            if isEditing {
                DatePicker("Date",selection: $event.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
            }else {
                HStack {
                    Text(event.date,style: .date)
                    Text(event.date,style: .date)
                }
            }
            
            Text("Tasks")
                .fontWeight(.bold)

            ForEach($event.tasks) { $item in
                TaskRow(task: $item, isEditing: isEditing)
            }
            .onDelete { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            }
            
            Button {
                event.tasks.append(EventTask(text: "",isNew: true))
            }label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
            }
            .buttonStyle(.borderless)
        }
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $isPickingSymbol) {
            
        }
    }
}

//#Preview {
//    EventDetail()
//}
