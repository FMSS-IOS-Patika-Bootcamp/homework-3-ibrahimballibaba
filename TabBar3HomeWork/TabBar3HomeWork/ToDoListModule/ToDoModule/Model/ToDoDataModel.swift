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
    
    var newToDoData = [NewListToDoArray]()
    func getData() {
        let fetchRequest: NSFetchRequest<ToDoListModuleEntity> = ToDoListModuleEntity.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(ToDoListModuleEntity.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            newToDoData = results.map{
                NewListToDoArray(title: $0.title, description: $0.titleDescription, isCompleted: $0.isCompleted)
            }
            toDoDataModelDelegate?.didDataFetchProcessFinish(true)
        }catch{
            toDoDataModelDelegate?.didDataFetchProcessFinish(false)
            print("errorrr Fetchh")
        }
    }
}
