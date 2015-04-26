//
//  EducationItemTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class EducationItemTableViewCell: UITableViewCell {

    // MARK: - Properties

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
    
    // MARK: - Life Cycle
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        itemImage.layer.borderWidth = 1.0
        itemImage.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutIfNeeded()
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
