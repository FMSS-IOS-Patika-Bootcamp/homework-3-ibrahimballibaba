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
    
    var toDoArray: NewListToDoArray?
    var index: Int?
    
    //private var detailsToDoViewModelInstance = DetailsToDoViewModel()
    private var detailsToDoViewModelInstance = DetailsToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    
    }
    
    func setupUI(){
        if let toDoArray = toDoArray {
            titleLabel.text = toDoArray.title
            didDescreptionText.text = toDoArray.description
        }
    }
    
    
    @IBAction func didCompletedTapped(_ sender: UIButton) {
        detailsToDoViewModelInstance.didUpdateDataImage(index: index!)
        navigationController?.popViewController(animated: true)
    }
    

}

