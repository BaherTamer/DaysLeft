//
//  View+Extensions.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
