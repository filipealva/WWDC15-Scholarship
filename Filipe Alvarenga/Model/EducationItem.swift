//
//  EducationItem.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

class EducationItem {
    
    var title: String!
    var description: String!
    var startDate: String!
    var endDate: String!
    var image: UIImage!
    
    init(dict: [String: AnyObject]) {
        self.title = dict["title"] as? String ?? "No title"
        self.description = dict["description"] as? String ?? "No description"
        self.startDate = dict["startDate"] as? String ?? "No start date"
        self.endDate = dict["endDate"] as? String ?? "No end date"
        
        let imageName = dict["imageName"] as! String
        self.image = UIImage(named: imageName)
    }
    
}