//
//  EventDetailsView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 19/01/2023.
//

import SwiftUI

struct EventDetailsView: View {

    @ObservedObject var event: Event

    var notes: String {
        event.notes ?? ""
    }

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    EventIcon(icon: event.icon!, color: EventColor(rawValue: event.color!)!.color)

                    Text(event.name!)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(event.date!, style: .date)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)

                EventCountdown(date: event.date!)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Notes:")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text(notes.isEmpty ? "No notes were added" : notes)
                        .foregroundColor(notes.isEmpty ? .secondary : .primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .container()
            }
            .padding()
        }
        .background(Color(UIColor.systemGray6), ignoresSafeAreaEdges: .all)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        // TODO: Edit Event
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }

                    Button(role: .destructive) {
                        // TODO: Delete Event
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}
