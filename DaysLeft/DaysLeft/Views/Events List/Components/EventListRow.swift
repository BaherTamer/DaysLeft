//
//  EventListRow.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

struct EventListRow: View {

    @Environment(\.colorScheme) var colorScheme

    let event: Event

    private var daysLeft: DateComponents {
        Calendar.current.dateComponents([.day], from: .now, to: event.date!)
    }

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                EventIcon(icon: event.icon!, color: EventColor(rawValue: event.color!)!.color)

                VStack(alignment: .leading, spacing: 6) {
                    Text(event.name!)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(event.date!, style: .date)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            VStack {
                Text("\(daysLeft.day!)")
                    .font(Font(UIFont.systemFont(ofSize: 46, weight: .heavy, width: .compressed)))

                Text("Days Left")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .offset(y: -5)
            }
            .foregroundStyle(EventColor(rawValue: event.color!)!.color.opacity(0.85))
        }
        .padding()
        .background(colorScheme == .dark ? Color(UIColor.systemGray5) : .white)
        .cornerRadius(15)
    }
}
