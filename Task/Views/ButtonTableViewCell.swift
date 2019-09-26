//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Austin Goetz on 9/25/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let delegate = delegate
            else { return }
        
        delegate.buttonCellButtonTapped(self)
    }

}

extension ButtonTableViewCell {
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}


