//
//  CustomAppearance.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

/**
    Custom Appearance structure. Contains all attributes and methods required to apply custom appearance who are not related to a component or a class.

    :param: navFont The font style used in the navigation bar title
*/


struct CustomAppearance {
    
    static let navFont = UIFont(name: "OpenSans-Bold", size: 17.0)!
    
    static func applyCustomAppearanceToNavigationBar() {
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.blackColor()
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navFont, NSForegroundColorAttributeName: UIColor.blackColor()]
    }
    
}