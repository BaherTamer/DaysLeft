//
//  AboutView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct AboutView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0...5, id: \.self) { _ in
                    QuestionRow()
                }
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView()
        }
    }
}
