//
//  EventIcon.swift
//  DaysLeft
//
//  Created by Baher Tamer on 19/01/2023.
//

import SwiftUI

struct EventIcon: View {

    let icon: String
    let color: Color

    var body: some View {
        Text(icon)
            .font(.largeTitle)
            .padding(12)
            .background(color.gradient.opacity(0.65))
            .cornerRadius(10)
    }
}

struct EventIcon_Previews: PreviewProvider {
    static var previews: some View {
        EventIcon(icon: "🎂", color: .indigo)
    }
}
