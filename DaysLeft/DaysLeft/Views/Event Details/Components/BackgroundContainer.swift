//
//  BackgroundContainer.swift
//  DaysLeft
//
//  Created by Baher Tamer on 19/01/2023.
//

import SwiftUI

struct BackgroundContainer: ViewModifier {

    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(colorScheme == .dark ? Color(UIColor.systemGray5) : .white)
            .cornerRadius(10)
    }
}

extension View {
    func container() -> some View {
        modifier(BackgroundContainer())
    }
}
