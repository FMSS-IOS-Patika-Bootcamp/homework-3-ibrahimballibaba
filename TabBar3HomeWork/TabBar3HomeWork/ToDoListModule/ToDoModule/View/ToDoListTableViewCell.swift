//
//  ToDoListTableViewCell.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 8
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 8
        switchImage.layer.cornerRadius = 8
    }
}


extension ToDoListTableViewCell {
    func dataUI(_ model: ToDoListModuleEntity){
        titleLabel.text = model.title
        if model.isCompleted{
            switchImage.image = UIImage(systemName: "checkmark.seal.fill")
        }else{
            switchImage.image = UIImage(systemName: "checkmark.seal")
        }
    }
}
