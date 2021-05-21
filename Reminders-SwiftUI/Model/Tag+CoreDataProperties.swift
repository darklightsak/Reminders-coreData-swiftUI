//
//  Tag+CoreDataProperties.swift
//  Reminders
//
//  Created by Surasak Wattanapradit on 21/5/2564 BE.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var title: String?
    @NSManaged public var reminders: Set<Reminder>
    
    static func fetchOrCreateWith(title: String?,
                                  in context: NSManagedObjectContext) -> Tag {
        let request: NSFetchRequest<Tag> = fetchRequest()
        let predicate = NSPredicate(format: "%K == %@", "title", (title ?? "").lowercased())
        request.predicate = predicate
        
        do {
            let results = try context.fetch(request)
            
            if let tag = results.first {
                return tag
            } else {
                let tag = Tag(context: context)
                tag.title = title?.lowercased()
                return tag
            }
        } catch {
            fatalError("Error fetching tags")
        }
    }
}

