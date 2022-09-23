//
//  AddToDoViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation
//protocol AddToDoViewModelProtocol: AnyObject {
//    func didCellFetchToDo(_ toDo: [NewListToDoArray])
//}

final class AddToDoViewModel {
    
 //   weak var addToDoViewModelDelegate: AddToDoViewModelProtocol?
    
    private var addToDoModelInstance = AddToDoModel()
    
    func saveButtonTapped(titleText: String, descriptionText: String){
        addToDoModelInstance.fetchData(titleText: titleText, descriptionText: descriptionText)
    }
}

