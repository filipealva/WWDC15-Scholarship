//
//  Project.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

/**
    Project model class.

    :param: name The project name.
    :param: description The project description.
    :param: appStore The URL of the project in App Store.
    :param: gitHub The URL of the repository of this project at GitHub.
    :param: image The image of this project.
*/

class Project {
    
    var name: String!
    var description: String!
    var appStore: String?
    var gitHub: String?
    var image: UIImage!
    
    init(dict: [String: AnyObject]) {
        self.name = dict["name"] as? String ?? "No name"
        self.description = dict["description"] as? String ?? "No description"
        self.appStore = dict["appstore"] as? String
        self.gitHub = dict["github"] as? String
        
        let imageName = dict["imageName"] as! String
        self.image = UIImage(named: imageName)
    }
    
}