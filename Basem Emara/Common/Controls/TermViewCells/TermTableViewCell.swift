//
//  TagTableViewCell.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-09-26.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit

class TermTableViewCell: UITableViewCell, TermsDataViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
}

extension TermTableViewCell {
    
    func bind(_ model: TermsDataViewModel) {
        nameLabel.text = model.name
        countLabel.text = "(\(model.count))"
    }
}
