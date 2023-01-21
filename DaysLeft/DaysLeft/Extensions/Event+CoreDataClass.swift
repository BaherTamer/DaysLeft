//
//  Event+CoreDataClass.swift
//  DaysLeft
//
//  Created by Baher Tamer on 17/01/2023.
//

import CoreData
import Foundation

@objc(Event)
public class Event: NSManagedObject {

    static var allEvents: NSFetchRequest<Event> {
        let request = Event.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]

        return request
    }

    static func getEventById(_ id: NSManagedObjectID) -> Event {
        let viewContext = CoreDataManager.shared.viewContext

        guard let event = viewContext.object(with: id) as? Event else {
            fatalError("Event was not found.")
        }

        return event
    }
}
