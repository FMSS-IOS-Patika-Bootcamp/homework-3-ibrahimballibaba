//
//  DetailsToDoModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 23.09.2022.
//

import Foundation
import CoreData



final class DetailsToDoModel {
    
    func updateToDoList(_ index: Int){
        let fetchRequest: NSFetchRequest<ToDoListModuleEntity> = ToDoListModuleEntity.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(ToDoListModuleEntity.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            let isCompleted = results[index].isCompleted
            
            results[index].setValue(!isCompleted, forKey: #keyPath(ToDoListModuleEntity.isCompleted))
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
           
        }catch{
           
            print("errorrr details data model")
        }
}
}
