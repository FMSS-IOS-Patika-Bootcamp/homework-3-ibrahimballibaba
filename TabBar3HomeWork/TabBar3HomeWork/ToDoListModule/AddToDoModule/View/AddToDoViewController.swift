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
    @IBOutlet weak var saveTapped: UIButton!
    
    private var addToDoViewModelInstance = AddToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveTapped.layer.cornerRadius = 8
        descriptionText.layer.cornerRadius = 8
        titleText.layer.cornerRadius = 8
        
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let titleText = titleText.text, !titleText.isEmpty else {return}
        guard let descriptionText = descriptionText.text, !descriptionText.isEmpty else {return}
        addToDoViewModelInstance.saveButtonTapped(titleText: titleText, descriptionText: descriptionText)
        
        navigationController?.popViewController(animated: true)
        
    }
}
