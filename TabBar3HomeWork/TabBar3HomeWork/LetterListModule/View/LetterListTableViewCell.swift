//
//  PostListTableViewCell.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit

class LetterListTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
