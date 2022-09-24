//
//  DetailsToDoViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation



final class DetailsToDoViewModel {
    
    private var detailsToDoModelInstance = DetailsToDoModel()
    
    func didUpdateDataTry(toDo: ToDoListModuleEntity){
        detailsToDoModelInstance.tryWithEntity(toDo)
    }
}


