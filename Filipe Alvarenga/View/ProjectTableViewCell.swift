//
//  ProjectTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet weak var projectIcon: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var appStoreButton: UIButton!
    
    var project: Project! {
        didSet {
            configureProject()
        }
    }
    
    // MARK: - Life Cycle
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        projectIcon.layer.borderWidth = 1.0
        projectIcon.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        appStoreButton.layer.borderWidth = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutIfNeeded()
    }
    
    // MARK: - Data Binding
    
    func configureProject() {
        projectIcon.image = project.image
        projectName.text = project.name
        projectDescription.text = project.description
    }

}
