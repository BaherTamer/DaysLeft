//
//  EventsListView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

struct EventsListView: View {

    var body: some View {
        List {
            Group {
                EventListRow(icon: "💍", color: .red, name: "Anniversary ", date: DateComponents(calendar: Calendar.current, year: 2023, month: 10, day: 24).date!)

                EventListRow(icon: "🎂", color: .indigo, name: "Birthday", date: DateComponents(calendar: Calendar.current, year: 2023, month: 6, day: 20).date!)

                EventListRow(icon: "🕌", color: .green, name: "Ramadan", date: DateComponents(calendar: Calendar.current, year: 2023, month: 3, day: 15).date!)
            }
            .listRowBackground(EmptyView())
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .background(Color(UIColor.systemGray6), ignoresSafeAreaEdges: .all)
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventsListView()
        }
    }
}
