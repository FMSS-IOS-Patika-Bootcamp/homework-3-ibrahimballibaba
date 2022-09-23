//
//  AddToDoModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import CoreData

//protocol AddToDoModelProtocol: AnyObject {
//    func didDataFetchProcessFinish(_ isSuccess: Bool)
//}

final class AddToDoModel {
  //  weak var addToDoModelDelegate: AddToDoModelProtocol?
    
    
    func fetchData(titleText: String, descriptionText: String){
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = ToDoListModuleEntity(context: managedContext)
       // let workingPredicate = NSPredicate(format: "%K = %@", (\User.id)._kvcKeyPathString!, id)
        data.setValue(UUID(), forKey: #keyPath(ToDoListModuleEntity.idTry))
        data.setValue(Bool(), forKey: #keyPath(ToDoListModuleEntity.isCompleted))
        data.setValue(Date(), forKey: #keyPath(ToDoListModuleEntity.date))
        data.setValue(titleText, forKey: #keyPath(ToDoListModuleEntity.title))
        data.setValue(descriptionText, forKey: #keyPath(ToDoListModuleEntity.titleDescription))
     //   addToDoModelDelegate?.didDataFetchProcessFinish(true)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }

}
