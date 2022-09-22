//
//  ToDoListViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

protocol ToDoListViewModelProtocol: AnyObject {
    func didCellFetchToDo(_ toDo: [NewListToDoArray])
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
    
}

//private extension GalleryListViewModel {
//    @discardableResult
//    func makeViewBaseModel(_ toDos: [Photos]) -> [N]{
//        return photos.map{.init(id: $0.id, url: $0.url)}
//    }
//}

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
