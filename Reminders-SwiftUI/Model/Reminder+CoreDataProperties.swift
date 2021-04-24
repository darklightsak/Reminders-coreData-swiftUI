//
//  Reminder+CoreDataProperties.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 25/4/2564 BE.
//

import CoreData
import SwiftUI

extension Reminder {
  @NSManaged var title: String
  @NSManaged var isCompleted: Bool
  @NSManaged var notes: String?
  @NSManaged var dueDate: Date?
  @NSManaged var priority: Int16
  
  static func createWith(title: String,
                         notes: String?,
                         date: Date?,
                         priority: ReminderPriority,
                         using viewContext: NSManagedObjectContext) {
    let reminder = Reminder(context: viewContext)
    reminder.title = title
    reminder.notes = notes
    reminder.dueDate = date
    reminder.priority = priority.rawValue
    
    do {
      try viewContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolveed error \(nserror), \(nserror.userInfo)")
    }
  }
  
  static func basicFetchRequest() -> FetchRequest<Reminder> {
    FetchRequest(entity: Reminder.entity(), sortDescriptors: [])
  }
}