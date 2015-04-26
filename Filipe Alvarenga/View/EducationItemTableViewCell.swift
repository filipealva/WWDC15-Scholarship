//
//  EducationItemTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class EducationItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    var educationItem: EducationItem! {
        didSet {
            configureEducationItem()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        itemImage.layer.borderWidth = 1.0
        itemImage.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
    }
    
    // MARK: - Data Binding
    
    func configureEducationItem() {
        itemTitle.text = educationItem.title
        itemDescription.text = educationItem.description
        startDate.text = educationItem.startDate
        endDate.text = educationItem.endDate
        itemImage.image = educationItem.image
    }
    
}
