//
//  AddToDoModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import CoreData

protocol AddToDoModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

final class AddToDoModel {
    weak var addToDoModelDelegate: AddToDoModelProtocol?
    
    //var toDoItems: NewListToDoArray?
    
    func fetchData(titleText: String, descriptionText: String){
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = ToDoListModuleEntity(context: managedContext)
        data.setValue(Date(), forKey: #keyPath(ToDoListModuleEntity.date))
        data.setValue(titleText, forKey: #keyPath(ToDoListModuleEntity.title))
        data.setValue(descriptionText, forKey: #keyPath(ToDoListModuleEntity.titleDescription))
        addToDoModelDelegate?.didDataFetchProcessFinish(true)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }

}
