//
//  NoteItem+CoreDataProperties.swift
//  Project
//
//  Created by user193967 on 3/29/21.
//
//

import Foundation
import CoreData


extension NoteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItem> {
        return NSFetchRequest<NoteItem>(entityName: "NoteItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var price: Int32
    @NSManaged public var content: String?
    @NSManaged public var vetName: String?

}

extension NoteItem : Identifiable {

}
