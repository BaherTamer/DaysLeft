//
//  SettingsFooter.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct SettingsFooter: View {
    var body: some View {
        Section {
            EmptyView()
        } footer: {
            VStack(spacing: 6) {
                Text("Days Left")
                    .font(.headline)

                Text("v1.2.6")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct SettingsFooter_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFooter()
    }
}
