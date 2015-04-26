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
    @IBOutlet weak var storyDate: UILabel!
    
    var story: Story! {
        didSet {
            configureStory()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let shadowPath = UIBezierPath(rect: storyContainer.bounds)
        storyContainer.layer.masksToBounds = false
        storyContainer.layer.shadowColor = UIColor.blackColor().CGColor
        storyContainer.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        storyContainer.layer.shadowOpacity = 0.5
        storyContainer.layer.shadowRadius = 1.0
        storyContainer.layer.shadowPath = shadowPath.CGPath
        storyContainer.layer.cornerRadius = 2.0

        dot.layer.cornerRadius = dot.bounds.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: superview!.bounds.width, height: superview!.bounds.height)
        
        adjustConstraintsToFit()
    }
    
    // MARK: - Data Binding
    
    func configureStory() {
        self.storyTitle.text = self.story.title
        self.storyDescription.text = self.story.description
        self.storyDate.text = self.story.date
    }
    
    // MARK: - Resizing Helpers
    
    func adjustConstraintsToFit() {
        storyDescription.layoutIfNeeded()
        storyContainerHeightConstraint.constant = storyDescription.frame.origin.y + storyDescription.frame.size.height + 8.0
    }
    
}
