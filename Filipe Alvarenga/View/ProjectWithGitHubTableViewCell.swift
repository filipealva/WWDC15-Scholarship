//
//  ProjectWithGitHubTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class ProjectWithGitHubTableViewCell: UITableViewCell {

    @IBOutlet weak var projectIcon: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var gitHubButton: UIButton!
    @IBOutlet weak var appStoreButton: UIButton!

    var project: Project! {
        didSet {
            configureProject()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        projectIcon.layer.borderWidth = 1.0
        projectIcon.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        gitHubButton.layer.borderWidth = 0.5
        appStoreButton.layer.borderWidth = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        projectName.layoutIfNeeded()
    }
    
    // MARK: - Data Binding
    
    func configureProject() {
        projectIcon.image = project.image
        projectName.text = project.name
        projectDescription.text = project.description
    }
}
