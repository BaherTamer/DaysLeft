//
//  EventsListView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

struct EventsListView: View {

    @FetchRequest(fetchRequest: Event.allEvents) var events

    var body: some View {
        List {
            ForEach(events, id: \.id) { event in
                ZStack {
                    NavigationLink {
                        EventDetailsView(event: event)
                    } label: {
                        EmptyView()
                    }

                    EventListRow(event: event)
                }

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
