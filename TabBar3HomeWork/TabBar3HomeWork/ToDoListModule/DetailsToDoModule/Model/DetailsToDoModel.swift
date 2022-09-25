//
//  DetailsToDoModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 23.09.2022.
//

import Foundation
import CoreData



final class DetailsToDoModel {
    
    //Update checkImage
    func tryWithEntity(_ toDoEntity: ToDoListModuleEntity){
        let isCompleted = toDoEntity.isCompleted
        toDoEntity.setValue(!isCompleted, forKey: #keyPath(ToDoListModuleEntity.isCompleted))
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
}
