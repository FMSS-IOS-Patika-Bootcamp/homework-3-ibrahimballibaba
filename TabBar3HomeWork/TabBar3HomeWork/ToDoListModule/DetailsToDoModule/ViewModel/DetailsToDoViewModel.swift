//
//  DetailsToDoViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation



final class DetailsToDoViewModel {
    
    private var detailsToDoModelInstance = DetailsToDoModel()
    
    //The func access to the DetailsToDoModel
    func didUpdateDataTry(toDo: ToDoListModuleEntity){
        detailsToDoModelInstance.tryWithEntity(toDo)
    }
}


