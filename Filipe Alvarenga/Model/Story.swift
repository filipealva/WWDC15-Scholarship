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
    
    - parameter title: The story title.
    - parameter description: The story description.
*/

class Story {
    
    var title: String!
    var description: String!
    var date: String!
    
    init(dict: [String: AnyObject]) {
        self.title = dict["title"] as? String ?? "No title"
        self.description = dict["description"] as? String ?? "No description"
        
        if let date = dict["date"] as? String {
            self.date = date
        } else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy"
            self.date = dateFormatter.stringFromDate(NSDate()).capitalizedString
        }
    }
    
}