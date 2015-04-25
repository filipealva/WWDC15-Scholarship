//
//  CustomAppearance.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 25/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import Foundation

struct CustomAppearance {
    
    static let navFont = UIFont(name: "OpenSans-CondensedBold", size: 19.0)!
    
    static func applyCustomAppearanceToNavigationBar() {
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.blackColor()
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navFont, NSForegroundColorAttributeName: UIColor.blackColor()]
    }
    
}