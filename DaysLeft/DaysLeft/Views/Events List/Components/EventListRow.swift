//
//  EventListRow.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import SwiftUI

struct EventListRow: View {

    let icon: String
    let color: Color
    let name: String
    let date: Date

    private var daysLeft: DateComponents {
        Calendar.current.dateComponents([.day], from: .now, to: date)
    }

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Text(icon)
                    .font(.largeTitle)
                    .padding(12)
                    .background(color.gradient.opacity(0.65))
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(date, style: .date)
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
            .foregroundStyle(color.opacity(0.85))
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
    }
}

struct EventListRow_Previews: PreviewProvider {
    static var previews: some View {
        EventListRow(icon: "🎂", color: .indigo, name: "Birthday", date: DateComponents(calendar: Calendar.current, year: 2024, month: 1, day: 1).date!)
    }
}
