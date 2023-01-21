//
//  EventDetailsView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 19/01/2023.
//

import SwiftUI

struct EventDetailsView: View {

    @Environment(\.dismiss) var dismiss

    @ObservedObject var event: Event

    @State private var showingAddEventView: Bool = false

    var notes: String {
        event.notes ?? ""
    }

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    EventIcon(icon: event.icon ?? "", color: EventColor(rawValue: event.color ?? "red")!.color)

                    Text(event.name ?? "New Event")
                        .font(.title)
                        .fontWeight(.bold)

                    Text(event.date ?? .now, style: .date)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)

                EventCountdown(date: event.date ?? .now)

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
                        self.showingAddEventView.toggle()
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }

                    Button(role: .destructive) {
                        CoreDataManager.shared.deleteEvent(event)
                        dismiss()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $showingAddEventView) {
            AddEventView(eventToEdit: event)
        }
    }
}
