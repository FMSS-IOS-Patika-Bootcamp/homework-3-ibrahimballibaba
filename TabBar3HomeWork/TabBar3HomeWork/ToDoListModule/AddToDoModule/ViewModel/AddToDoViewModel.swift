//
//  AddToDoViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

final class AddToDoViewModel {
    
    private var addToDoModelInstance = AddToDoModel()
    
    //the function access to AddToDoModel
    func saveButtonTapped(titleText: String, descriptionText: String){
        addToDoModelInstance.fetchData(titleText: titleText, descriptionText: descriptionText)
    }
}

