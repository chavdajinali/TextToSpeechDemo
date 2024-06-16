//
//  EventList.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct EventList: View {
    
    @EnvironmentObject var eventData:EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    var body: some View {
        VStack {
            Text("Hello , world!")
        }
//        List {
//            ForEach(Period.allCases) { period in
//                
//                if !eventData.sortedEvents(period: period).isEmpty {
//                    Section(content: {
//                        ForEach(eventData.sortedEvents(period: period)) { $event in
//                            NavigationLink{
//                                
//                            }
//                            
//                        }
//                    })
//                }
//                
//            }
//        }
    }
}

#Preview {
    EventList()
}
