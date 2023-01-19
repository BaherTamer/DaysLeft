//
//  AddEventView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

struct AddEventView: View {

    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss

    @State private var icon: String = "🗓️"
    @State private var name: String = ""
    @State private var note: String = ""
    @State private var date: Date = .now
    @State private var color: EventColor = .indigo

    func isEmoji(string: String) -> Bool {
        let scalars = string.unicodeScalars

        return scalars.map { scalar in
            switch scalar.value {
            case 0x1F600...0x1F64F, 0x1F300...0x1F5FF, 0x1F680...0x1F6FF, 0x2600...0x26FF, 0x2700...0x27BF, 0xFE00...0xFE0F:
                return true

            default: return false
            }
        }.reduce(true) { $0 && $1 }
    }

    func addEvent() {
        let newEvent = Event(context: viewContext)

        newEvent.id = UUID()
        newEvent.icon = icon
        newEvent.name = name
        newEvent.color = color.rawValue
        newEvent.date = date
        newEvent.notes = note

        saveContext()
    }

    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    EmojiTextField(text: $icon)
                        .fixedSize()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(color.color.gradient.opacity(0.65))
                        .clipShape(Circle())
                        .onTapGesture {
                            icon = ""
                        }
                        .onChange(of: icon) { _ in
                            if icon.count == 1 {
                                hideKeyboard()
                            }
                        }

                    TextField("Event Title", text: $name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
                .listRowSeparator(.hidden)

                Section {
                    EventColorPicker(eventColor: $color)
                }

                Section {
                    DatePicker("Date", selection: $date, in: (.now)..., displayedComponents: .date)

                    NotesTextEditor(note: $note)
                }
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.primary)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        addEvent()
                        dismiss()
                    }
                    .tint(.primary)
                }
            }
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
