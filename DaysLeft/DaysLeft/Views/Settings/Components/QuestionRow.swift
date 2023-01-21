//
//  QuestionRow.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct QuestionRow: View {

    let question = "Neque porro quisquam est qui dolorem?"
    let answer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut rhoncus augue."

    var body: some View{
        DisclosureGroup {
            VStack(alignment: .leading, spacing: 8) {
                Divider()
                Text(answer)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
        } label: {
            Text(question)
                .font(.headline)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .tint(.primary)
    }
}

struct QuestionRow_Previews: PreviewProvider {
    static var previews: some View {
        QuestionRow()
    }
}
