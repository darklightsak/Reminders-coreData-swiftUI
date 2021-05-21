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
  @NSManaged var list: ReminderList
  @NSManaged var tags: Set<Tag>?
  
  static func createWith(title: String,
                         notes: String?,
                         date: Date?,
                         priority: ReminderPriority,
                         tags: Set<Tag> = [],
                         in list: ReminderList,
                         using viewContext: NSManagedObjectContext) {
    let reminder = Reminder(context: viewContext)
    reminder.title = title
    reminder.notes = notes
    reminder.dueDate = date
    reminder.priority = priority.rawValue
    reminder.tags = tags
    reminder.list = list
    
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
  
  static func sortedFetchRequest() -> FetchRequest<Reminder> {
    let dateSortDescriptor = NSSortDescriptor(key: "dueDate", ascending: false)
    return FetchRequest(entity: Reminder.entity(), sortDescriptors: [dateSortDescriptor])
  }
  
  static func fetchRequestSortedByTitleAndPriority() -> FetchRequest<Reminder> {
    let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    let prioritySortDescriptor = NSSortDescriptor(key: "priority", ascending: false)
    return FetchRequest(entity: Reminder.entity(), sortDescriptors: [titleSortDescriptor, prioritySortDescriptor])
  }
  
  static func completedRemidersFetchRequest() -> FetchRequest<Reminder> {
    let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    let prioritySortDescriptor = NSSortDescriptor(key: "priority", ascending: false)
    let isCompletedPredicate = NSPredicate(format: "%K == %@", "isCompleted", NSNumber(value: false))
    
    return FetchRequest(entity: Reminder.entity(),
                        sortDescriptors: [titleSortDescriptor, prioritySortDescriptor],
                        predicate: isCompletedPredicate)
  }
  
  static func reminders(in list: ReminderList) -> FetchRequest<Reminder> {
    let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    let prioritySortDescriptor = NSSortDescriptor(key: "priority", ascending: false)
    
    let listPredicate = NSPredicate(format: "%K == %@", "list.title", list.title ?? "")
    let isCompletedPredicate = NSPredicate(format: "%K == %@", "isCompleted", NSNumber(value: false))
    
    let combinedPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [listPredicate, isCompletedPredicate])
    
    return FetchRequest(entity: Reminder.entity(),
                        sortDescriptors: [titleSortDescriptor, prioritySortDescriptor],
                        predicate: combinedPredicate)
  }
}
