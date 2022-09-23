//
//  ToDoListViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
import UIKit

protocol ToDoListViewModelProtocol: AnyObject {
    func didCellFetchToDo(_ toDo: [NewListToDoArray])
}


final class ToDoListViewModel {
    weak var toDoListViewModelDelegate: ToDoListViewModelProtocol?
    
    
   // var detailsToDoVC = DetailsToDoViewController()
    private var toDoDataModelInstance = ToDoDataModel()
    
    init(){
        toDoDataModelInstance.toDoDataModelDelegate = self
    }
    
    func didViewLoad(){
        toDoDataModelInstance.getData()
    }
    
    func didClickToDo(_ index: Int){
        let selectedToDo = toDoDataModelInstance.newToDoData[index]
        print(selectedToDo)
       // let destinVC = UIStoryboard().instantiateViewController(withIdentifier:"detailsToDoVC") as! DetailsToDoViewController
       // UINavigationController().pushViewController(destinVC, animated: true)
        //detailsToDoVC.toDoArray = selectedToDo
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
