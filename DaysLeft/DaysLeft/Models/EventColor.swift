//
//  EventColor.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

enum EventColor: String, CaseIterable {
    case red
    case orange
    case yellow
    case green
    case mint
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case gray
}

extension EventColor {
    var color: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .mint:
            return .mint
        case .cyan:
            return .cyan
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        case .pink:
            return .pink
        case .brown:
            return .brown
        case .gray:
            return .gray
        }
    }
}
