//
//  ColorSchemePicker.swift
//  DaysLeft
//
//  Created by Baher Tamer on 22/01/2023.
//

import SwiftUI

struct ColorSchemePicker: View {

    @EnvironmentObject var preferencesModel: PreferencesModel

    var body: some View {
        Picker(selection: $preferencesModel.appColorScheme) {
            ForEach(ColorSchemeType.allCases, id: \.self) { scheme in
                Text(scheme.title)
                    .tag(scheme)
            }
        } label: {
            SettingsRow(title: "Dark Mode", icon: "moon.fill")
        }
        .pickerStyle(.menu)
    }
}

struct ColorSchemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorSchemePicker()
            .environmentObject(PreferencesModel())
    }
}
