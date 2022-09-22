//
//  AddToDoViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    private var addToDoViewModelInstance = AddToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let titleText = titleText.text else {return}
        guard let descriptionText = descriptionText.text else {return}
        addToDoViewModelInstance.saveButtonTapped(titleText: titleText, descriptionText: descriptionText)
     //   let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
     //   let data = ToDoListModuleEntity(context: managedContext)
     //   if let titleText = titleText.text{
     //       data.setValue(titleText, forKey: #keyPath(ToDoListModuleEntity.title))
     //   }
     //   if let descriptionText = descriptionText.text{
     //       data.setValue(descriptionText, forKey: #keyPath(ToDoListModuleEntity.titleDescription))
     //   }
     //
     //   AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
}
