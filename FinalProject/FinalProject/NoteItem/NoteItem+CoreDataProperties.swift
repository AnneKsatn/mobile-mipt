//
//  NoteItem+CoreDataProperties.swift
//  FinalProject
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

    @NSManaged public var date: Date?
    @NSManaged public var title: String?

}

extension NoteItem : Identifiable {

}
