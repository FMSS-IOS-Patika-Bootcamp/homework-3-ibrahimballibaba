//
//  AddToDoModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import CoreData


final class AddToDoModel {
    
    
    func fetchData(titleText: String, descriptionText: String){
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = ToDoListModuleEntity(context: managedContext)
        data.setValue(Bool(), forKey: #keyPath(ToDoListModuleEntity.isCompleted))
        data.setValue(Date(), forKey: #keyPath(ToDoListModuleEntity.date))
        data.setValue(titleText, forKey: #keyPath(ToDoListModuleEntity.title))
        data.setValue(descriptionText, forKey: #keyPath(ToDoListModuleEntity.titleDescription))
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }

}
