//
//  DatePlannerApp.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct DatePlannerApp: View {
    @StateObject private var eventData = EventData()
    var body: some View {
        //WindowGroup {
            NavigationView {
                EventList()
                Text("Select an Event.")
                    .foregroundStyle(.secondary)
            }
        //}
    }
}

#Preview {
    DatePlannerApp()
}
