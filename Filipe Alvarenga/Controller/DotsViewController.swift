//
//  DotsViewController.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 17/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class DotsViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var bottomBar: UIView!
    
    lazy var line: UIView = { [unowned self] in
        let firstDotView = self.dotViews.first!
        let firstDot = firstDotView.dot
        let line = UIView(frame: CGRect(x: firstDot.center.x, y: firstDot.center.y, width: 3.0, height: 0.0))
        line.backgroundColor = UIColor.blackColor()
        line.layer.cornerRadius = 2.0
        
        return line
    }()
    
    lazy var dotViews: [DotView] = {
        map(enumerate(self.stories)) { [unowned self] (index, story) in
            let dotView = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as! DotView
            let dotViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * CGFloat(index), width: dotView.bounds.width, height: dotView.bounds.height)
            dotView.frame = dotViewFrame
            dotView.story = story
            
            return dotView
        }
    }()
    
    lazy var stories: [Story] = {
        let pathToAboutMe = NSBundle.mainBundle().pathForResource("AboutMe", ofType: "plist")!
        let aboutMe = NSDictionary(contentsOfFile: pathToAboutMe) as! [String: AnyObject]
        let stories = aboutMe["Stories"] as! [[String: AnyObject]]
        return map(stories, {Story(dict: $0)})
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDotsToView()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Dots Configuration
    
    func addDotsToView() {
        for dotView in dotViews {
            baseScrollView.addSubview(dotView)
        }
        
        baseScrollView.addSubview(line)
        baseScrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * CGFloat(dotViews.count))
    }

}

extension DotsViewController: UIScrollViewDelegate {

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let yOffsetMin: CGFloat = 0.0
        let yOffsetMax = self.view.bounds.height * CGFloat(dotViews.count - 1)
        
        if yOffset > yOffsetMin && yOffset < yOffsetMax {
            updateLineFrameBasedOnOffset(yOffset)
        }
    }
    
    // MARK: - Scroll Effects Helpers
    
    func updateLineFrameBasedOnOffset(yOffset: CGFloat) {
        var newFrame = line.frame
        newFrame.size = CGSize(width: newFrame.size.width, height: yOffset)
            
        UIView.animateWithDuration(0.5, animations: { [unowned self] () -> Void in
            self.line.frame = newFrame
        })
    }
    
}
