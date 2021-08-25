//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Denis Kuzmin on 25.08.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, description: String) {
        taskNameLabel.text = name
        taskDescriptionLabel.text = description
    }
    
}
