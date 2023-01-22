//
//  AddEventView.swift
//  DaysLeft
//
//  Created by Baher Tamer on 18/01/2023.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var localNotificationManager: LocalNotificationManager

    @State private var icon: String = "🗓️"
    @State private var name: String = ""

    @State private var note: String = ""
    @State private var date: Date = .now

    @State private var color: EventColor = .indigo

    @State private var isAlertEnabled: Bool = false
    @State private var alertDate: Date = .now

    private var eventToEdit: Event?

    init(eventToEdit: Event? = nil) {
        self.eventToEdit = eventToEdit
    }

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

    private func addEditEvent() {
        let coreDataManager = CoreDataManager.shared

        if let eventToEdit {
            coreDataManager.editEvent(eventToEdit, icon: icon, name: name, color: color.rawValue, date: date, notes: note, isAlertEnabled: isAlertEnabled, alertDate: alertDate)
        } else {
            coreDataManager.addEvent(icon: icon, name: name, color: color.rawValue, date: date, notes: note, isAlertEnabled: isAlertEnabled, alertDate: alertDate)
        }
    }

    private func scheduleNotification() async {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: alertDate)
        let title = "Don't Forget \(icon) \(name)!"

        let localNotification = LocalNotification(id: UUID().uuidString, title: title, date: dateComponents)

        await localNotificationManager.schedule(localNotification: localNotification)
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
                        .tint(color.color)

                    NotesTextEditor(note: $note)
                }

                Section {
                    Toggle("Alert", isOn: $isAlertEnabled)
                        .tint(.green)

                    if isAlertEnabled {
                        DatePicker("Alert Date", selection: $alertDate, in: (.now)..., displayedComponents: [.date, .hourAndMinute])
                            .tint(color.color)
                    }
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
                        addEditEvent()

                        if isAlertEnabled {
                            Task {
                                await scheduleNotification()
                            }
                        }

                        dismiss()
                    }
                    .tint(.primary)
                }
            }
        }
        .onAppear {
            if let eventToEdit {
                self.icon = eventToEdit.icon!
                self.name = eventToEdit.name!
                self.color = EventColor(rawValue: eventToEdit.color!)!
                self.date = eventToEdit.date!
                self.note = eventToEdit.notes ?? ""
                self.isAlertEnabled = eventToEdit.isAlertEnabled
                self.alertDate = eventToEdit.alertDate ?? .now
            }
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
            .environmentObject(LocalNotificationManager())
    }
}
