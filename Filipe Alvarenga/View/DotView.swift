//
//  DotView.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 18/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class DotView: UIView {
    
    @IBOutlet weak var storyContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var storyContainer: UIView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyDescription: UILabel!
    
    override func drawRect(rect: CGRect) {
        let shadowPath = UIBezierPath(rect: self.storyContainer.bounds)
        self.storyContainer.layer.masksToBounds = false;
        self.storyContainer.layer.shadowColor = UIColor.blackColor().CGColor
        self.storyContainer.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.storyContainer.layer.shadowOpacity = 0.5;
        self.storyContainer.layer.shadowPath = shadowPath.CGPath;
        self.storyContainer.layer.cornerRadius = 3.0;
        
//        self.storyContainer.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dot.layer.cornerRadius = dot.bounds.height / 2
        storyContainer.layer.cornerRadius = 5.0
        
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.superview!.bounds.width, height: self.superview!.bounds.height)
    }

}
