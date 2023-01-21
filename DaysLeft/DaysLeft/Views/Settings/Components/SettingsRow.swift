//
//  SettingsRow.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct SettingsRow: View {

    let title: String
    let icon: String

    var body: some View {
        Label(title, systemImage: icon)
            .imageScale(.large)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(title: "Delete", icon: "trash")
    }
}
