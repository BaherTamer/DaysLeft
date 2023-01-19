//
//  EventCountdown.swift
//  DaysLeft
//
//  Created by Baher Tamer on 19/01/2023.
//

import SwiftUI

struct EventCountdown: View {

    let date: Date

    private let titles: [String] = ["Year", "Month", "Day", "Hour", "Minute"]
    
    private var daysLeft: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: .now, to: date)
    }

    var body: some View {
        HStack(alignment: .bottom, spacing: 20) {
            EventDateComponent(number: daysLeft.year!, title: titles[0])
            EventDateComponent(number: daysLeft.month!, title: titles[1])
            EventDateComponent(number: daysLeft.day!, title: titles[2])
            EventDateComponent(number: daysLeft.hour!, title: titles[3])
            EventDateComponent(number: daysLeft.minute!, title: titles[4])
        }
        .container()
    }
}

struct EventDateComponent: View {
    let number: Int
    let title: String

    private func isSingular(_ number: Int) -> String {
        number == 1 ? "" : "s"
    }

    var body: some View {
        VStack {
            Text("\(number)")
            Text(title + isSingular(number))
        }
        .font(.subheadline)
        .fontWeight(.semibold)
    }
}

struct EventCountdown_Previews: PreviewProvider {
    static var previews: some View {
        EventCountdown(date: DateComponents(calendar: Calendar.current, year: 2024, month: 1, day: 1).date!)
    }
}
