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
    @IBOutlet weak var clickedCompleted: UIButton!
    
    var toDoArray: ToDoListModuleEntity?
    
    private var detailsToDoViewModelInstance = DetailsToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 8
        clickedCompleted.layer.cornerRadius = 8
        didDescreptionText.layer.cornerRadius = 8
    
    }
    
    func setupUI(){
        if let toDoArray = toDoArray {
            titleLabel.text = toDoArray.title
            didDescreptionText.text = toDoArray.titleDescription
        }
    }
    
    
    @IBAction func didCompletedTapped(_ sender: UIButton) {
        detailsToDoViewModelInstance.didUpdateDataTry(toDo: toDoArray!)
        navigationController?.popViewController(animated: true)
    }
    

}

