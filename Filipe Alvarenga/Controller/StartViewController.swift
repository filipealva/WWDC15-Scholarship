//
//  StartViewController.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 23/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var quoteContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var jobsQuote: UILabel!
    @IBOutlet weak var jobsName: UILabel!
    @IBOutlet weak var tapToStart: UILabel!
    @IBOutlet weak var shimmeringView: FBShimmeringView!
    
    var setNeedsDisplayIntro: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "start:")
        view.addGestureRecognizer(tapGestureRecognizer)
        
        configureShimmering()
    }
    
    // MARK: - Shimmering Configuration
    
    func configureShimmering() {
        shimmeringView.contentView = tapToStart
        shimmeringView.shimmering = true
        shimmeringView.shimmeringPauseDuration = 0.4
        shimmeringView.shimmeringAnimationOpacity = 0.2
        shimmeringView.shimmeringOpacity = 1.0
        shimmeringView.shimmeringSpeed = 150
        shimmeringView.shimmeringHighlightLength = 1.0
        shimmeringView.shimmeringDirection = FBShimmerDirection.Right
        shimmeringView.shimmeringBeginFadeDuration = 0.1
        shimmeringView.shimmeringEndFadeDuration = 0.3
        quoteContainerHeightConstraint.constant = jobsName.frame.origin.y + jobsName.frame.size.height
    }
    
    // MARK: - Actions
    
    func start(tapGesture: UITapGestureRecognizer) {
        let tappedPoint = tapGesture.locationInView(view)
        
        if CGRectContainsPoint(shimmeringView.frame, tappedPoint) {
            if let setNeedsDisplayIntro = setNeedsDisplayIntro {
                setNeedsDisplayIntro()
            }
            
            modalTransitionStyle = .CrossDissolve
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}
