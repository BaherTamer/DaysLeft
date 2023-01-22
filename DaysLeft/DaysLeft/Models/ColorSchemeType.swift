//
//  ColorSchemeType.swift
//  DaysLeft
//
//  Created by Baher Tamer on 22/01/2023.
//

import Foundation

enum ColorSchemeType: Int, CaseIterable {
    case unspecified
    case light
    case dark
}

extension ColorSchemeType {
    var title: String {
        switch self {
        case .unspecified:
            return String(localized: "automatic")
        case .light:
            return String(localized: "light")
        case .dark:
            return String(localized: "dark")
        }
    }
}
