//
//  CoreDataStack.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String){
        self.modelName = modelName // soldaki userInfo bir model name
    }
    
    //burada oluşturduğumuz storeContainer üzerinden manageObjectContext e erişiyoruz oradan da UserInfo içerisindeki entityde bulunan verilere erişiyoruz
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error Container loading\(error.localizedDescription)")
            }
        }
        return container
    }()
    
    //NSManageObjectContext is mean Mock
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext(){
        guard managedContext.hasChanges else{
            return
        }
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("error \(error)")
        }
    }
}
