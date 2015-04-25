//
//  ProjectTableViewCell.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectIcon: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var appStoreButton: UIButton!
    
    var project: Project! {
        didSet {
            configureProject()
        }
    }
    
    // MARK: - Data Binding
    
    func configureProject() {
        projectIcon.image = project.image
        projectName.text = project.name
        projectDescription.text = project.description
    }

}
