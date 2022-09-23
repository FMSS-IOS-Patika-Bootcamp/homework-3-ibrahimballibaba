//
//  ToDoListModuleEntity+CoreDataProperties.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//
//

import Foundation
import CoreData


extension ToDoListModuleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListModuleEntity> {
        return NSFetchRequest<ToDoListModuleEntity>(entityName: "ToDoListModuleEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var idTry: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var titleDescription: String?

}

extension ToDoListModuleEntity : Identifiable {

}
