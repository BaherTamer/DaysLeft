//
//  EventColorPicker.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

struct EventColorPicker: View {

    @Binding var eventColor: EventColor
    private let columnGrid = Array(repeating: GridItem(.flexible()), count: 6)

    var body: some View {
        LazyVGrid(columns: columnGrid) {
            ForEach(EventColor.allCases, id: \.self) { color in
                Circle()
                    .fill(color.color)
                    .padding(5)
                    .overlay(content: {
                        if color == eventColor {
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                    })
                    .onTapGesture {
                        withAnimation {
                            eventColor = color
                        }
                    }
            }
        }
    }
}

struct EventColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        EventColorPicker(eventColor: .constant(.indigo))
    }
}
