//
//  Project.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

class Project {
    
    var name: String!
    var description: String!
    var appStore: String?
    var image: UIImage!
    
    init(dict: [String: AnyObject]) {
        self.name = dict["name"] as? String ?? "No name"
        self.description = dict["description"] as? String ?? "No description"
        self.appStore = dict["appstore"] as? String
        
        let imageName = dict["imageName"] as! String
        self.image = UIImage(named: imageName)
    }
    
}