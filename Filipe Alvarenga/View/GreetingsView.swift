//
//  GreetingsView.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 23/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class GreetingsView: UIView {

    @IBOutlet weak var shimmeringView: FBShimmeringView!
    @IBOutlet weak var scrollDownArrow: UIImageView!
    @IBOutlet weak var greetingsMessageContainer: UIView!
    @IBOutlet weak var greetingsContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var greetingsMessageContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var greetingsMessage: UILabel!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        setupShimmeringView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        frame = CGRect(origin: frame.origin, size: CGSize(width: superview!.frame.size.width, height: superview!.frame.size.height))
        adjustConstraintsToFit()
    }
    
    // MARK: - Views Setup
    
    func setupShimmeringView() {
        shimmeringView.contentView = scrollDownArrow
        shimmeringView.shimmering = true
        shimmeringView.shimmeringPauseDuration = 0.4
        shimmeringView.shimmeringAnimationOpacity = 0.2
        shimmeringView.shimmeringOpacity = 1.0
        shimmeringView.shimmeringSpeed = 70
        shimmeringView.shimmeringHighlightLength = 1.0
        shimmeringView.shimmeringDirection = .Right
        shimmeringView.shimmeringBeginFadeDuration = 0.1
        shimmeringView.shimmeringEndFadeDuration = 0.3
    }
    
    // MARK: - Resizing Helpers
    
    func adjustConstraintsToFit() {
        greetingsMessage.layoutIfNeeded()
        
        let containerHeight = greetingsMessage.frame.origin.y + greetingsMessage.frame.size.height + 8.0
        greetingsMessageContainerHeightConstraint.constant = containerHeight
        greetingsContentHeightConstraint.constant = containerHeight
    }

}
