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
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
}