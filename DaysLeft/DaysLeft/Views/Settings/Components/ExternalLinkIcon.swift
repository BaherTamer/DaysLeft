//
//  ExternalLinkIcon.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct ExternalLinkIcon: View {
    var body: some View {
        Image(systemName: "arrow.up.forward")
            .foregroundColor(Color(UIColor.systemGray2))
    }
}

struct ExternalLinkIcon_Previews: PreviewProvider {
    static var previews: some View {
        ExternalLinkIcon()
    }
}
