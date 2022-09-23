//
//  DetailsToDoViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit
import SwiftUI

class DetailsToDoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var didDescreptionText: UITextView!
    
    var toDoArray: ToDoListModuleEntity?
    
    private var detailsToDoViewModelInstance = DetailsToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
    }
    
    func setupUI(){
        if let toDoArray = toDoArray {
            titleLabel.text = toDoArray.title
            didDescreptionText.text = toDoArray.titleDescription
        }
    }
    
    
    @IBAction func didCompletedTapped(_ sender: UIButton) {
        detailsToDoViewModelInstance.didUpdateDateTry(toDo: toDoArray!)
        navigationController?.popViewController(animated: true)
    }
    

}

