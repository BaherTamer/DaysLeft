//
//  CoreDataManager.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    private let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "DaysLeft")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to initialize Core Data Model \(error)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
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

    func addEvent(icon: String, name: String, color: String, date: Date, notes: String, isAlertEnabled: Bool = false, alertDate: Date?) {
        let newEvent = Event(context: viewContext)

        newEvent.id = UUID()
        newEvent.icon = icon
        newEvent.name = name.isEmpty ? "New Event" : name
        newEvent.color = color
        newEvent.date = date
        newEvent.notes = notes
        newEvent.isAlertEnabled = isAlertEnabled
        newEvent.alertDate = alertDate

        saveContext()
    }

    func editEvent(_ event: Event, icon: String, name: String, color: String, date: Date, notes: String, isAlertEnabled: Bool = false, alertDate: Date?) {
        let updatedEvent = Event.getEventById(event.objectID)

        updatedEvent.icon = icon
        updatedEvent.name = name.isEmpty ? "New Event" : name
        updatedEvent.color = color
        updatedEvent.date = date
        updatedEvent.notes = notes
        updatedEvent.isAlertEnabled = isAlertEnabled
        updatedEvent.alertDate = alertDate

        saveContext()
    }

    func deleteEvent(_ event: Event) {
        let deletedEvent = Event.getEventById(event.objectID)
        viewContext.delete(deletedEvent)
        saveContext()
    }
}
