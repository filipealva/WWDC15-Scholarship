//
//  Story.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 19/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

/**
    Story model class. 
    
    :param: title The story title.
    :param: description The story description.
*/

class Story {
    
    var title: String!
    var description: String!
    var date: String!
    
    init(dict: [String: AnyObject]) {
        self.title = dict["title"] as? String ?? "No title"
        self.description = dict["description"] as? String ?? "No description"
        self.date = dict["date"] as? String ?? "No date"
    }
    
}