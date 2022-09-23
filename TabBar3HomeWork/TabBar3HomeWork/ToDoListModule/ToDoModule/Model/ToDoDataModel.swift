//
//  ToDoDataModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import CoreData
protocol ToDoDataModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

final class ToDoDataModel {
    weak var toDoDataModelDelegate: ToDoDataModelProtocol?
    
    var newToDoData = [ToDoListModuleEntity]()
    func getData() {
        let fetchRequest: NSFetchRequest<ToDoListModuleEntity> = ToDoListModuleEntity.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(ToDoListModuleEntity.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            newToDoData = results
            toDoDataModelDelegate?.didDataFetchProcessFinish(true)
        }catch{
            toDoDataModelDelegate?.didDataFetchProcessFinish(false)
            print("errorrr Fetchh")
        }
    }
    
    func deleteSwipe(_ index: Int){
        // Remove the note from the CoreData
        AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(self.newToDoData[index])
        // Save Changes
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        let fetchRequest: NSFetchRequest<ToDoListModuleEntity> = ToDoListModuleEntity.fetchRequest()
        self.newToDoData = try! AppDelegate.sharedAppDelegate.coreDataStack.managedContext.fetch(fetchRequest)
    }
}
