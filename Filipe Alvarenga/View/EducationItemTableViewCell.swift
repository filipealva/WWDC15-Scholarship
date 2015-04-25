//
//  EducationItemTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class EducationItemTableViewCell: UITableViewCell {

    @IBOutlet weak var educationItemTitle: UILabel!
    @IBOutlet weak var educationItemDescription: UILabel!
    @IBOutlet weak var educationItemDate: UILabel!
    @IBOutlet weak var educationItemImage: UIImageView!
    
    var educationItem: EducationItem! {
        didSet {
            configureEducationItem()
        }
    }
    
    // MARK: - Data Binding
    
    func configureEducationItem() {
        educationItemTitle.text = educationItem.title
        educationItemDescription.text = educationItem.description
        educationItemDate.text = educationItem.date
        educationItemImage.image = educationItem.image
    }
    
}
