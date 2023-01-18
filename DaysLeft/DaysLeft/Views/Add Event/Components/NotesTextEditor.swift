//
//  NotesTextEditor.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

struct NotesTextEditor: View {

    @Binding var note: String

    private var notesPlaceholder: String {
        if !note.isEmpty {
            return ""
        } else {
            return "Notes"
        }
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $note)
                .multilineTextAlignment(.leading)
                .frame(minHeight: 100)

            Text(notesPlaceholder)
                .foregroundColor(.secondary)
                .offset(x: 4, y: 8)
        }
    }
}

struct NotesTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        NotesTextEditor(note: .constant(""))
    }
}
