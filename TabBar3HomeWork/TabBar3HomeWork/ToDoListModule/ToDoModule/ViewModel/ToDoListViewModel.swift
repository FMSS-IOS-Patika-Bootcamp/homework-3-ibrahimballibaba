//
//  ToDoListViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import UIKit

protocol ToDoListViewModelProtocol: AnyObject {
    func didCellFetchToDo(_ toDo: [ToDoListModuleEntity])
}


final class ToDoListViewModel {
    weak var toDoListViewModelDelegate: ToDoListViewModelProtocol?
    
    private var toDoDataModelInstance = ToDoDataModel()
    
    init(){
        toDoDataModelInstance.toDoDataModelDelegate = self
    }
    
    func didViewLoad(){
        toDoDataModelInstance.getData()
    }
    
    func didSwipe(_ index: Int){
        toDoDataModelInstance.deleteSwipe(index)
    }
}


extension ToDoListViewModel: ToDoDataModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess{
            let toDoItems = toDoDataModelInstance.newToDoData
            toDoListViewModelDelegate?.didCellFetchToDo(toDoItems)
        }else {
            print("Errorr View Modellll")
        }
    }
    
    
}
