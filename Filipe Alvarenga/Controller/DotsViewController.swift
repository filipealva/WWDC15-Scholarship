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
    @IBOutlet weak var shimmeringView: FBShimmeringView!
    @IBOutlet weak var aboutMeArrow: UIImageView!
    
    var needsDisplayIntro = true
    
    lazy var greetingsView: GreetingsView = {
       let greetingsView =  NSBundle.mainBundle().loadNibNamed("GreetingsView", owner: self, options: nil)[0] as! GreetingsView
       greetingsView.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: greetingsView.frame.size)
       
       return greetingsView
    }()
    
    lazy var line: UIView = { [unowned self] in
        let firstDotView = self.dotViews.first!
        let firstDot = firstDotView.dot
        firstDot.layoutIfNeeded()

        let line = UIView(frame: CGRect(x: firstDotView.dot.center.x - 1.5, y: self.view.bounds.height * 1.5, width: 3.0, height: 0.0))
        line.backgroundColor = UIColor.blackColor()
        line.layer.cornerRadius = 2.0
        
        return line
    }()
    
    lazy var dotViews: [DotView] = {
        self.stories.enumerate().map() { (index, story) in
            let dotView = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as! DotView
            let dotViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * CGFloat(index + 1), width: dotView.bounds.width, height: dotView.bounds.height)
            dotView.frame = dotViewFrame
            dotView.story = story
            
            return dotView
        }
    }()
    
    lazy var stories: [Story] = {
        let pathToAboutMe = NSBundle.mainBundle().pathForResource("AboutMe", ofType: "plist")!
        let aboutMe = NSDictionary(contentsOfFile: pathToAboutMe) as! [String: AnyObject]
        let stories = aboutMe["stories"] as! [[String: AnyObject]]
        
        return stories.map({Story(dict: $0)})
    }()
    
    var currentPage: Int = 0 {
        willSet(newValue) {
            switch newValue {
            case 0:
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.bottomBar.alpha = 0
                    self.greetingsView.shimmeringView.alpha = 1
                })
            case 1:
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.bottomBar.alpha = 0.96
                    self.greetingsView.shimmeringView.alpha = 0
                })
            case dotViews.count:
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.shimmeringView.alpha = 1
                })
            case dotViews.count - 1:
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.shimmeringView.alpha = 0
                })
            default:
                break
            }
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapToScrollDown = UITapGestureRecognizer(target: self, action: "scrollToFirstDot")
        greetingsView.shimmeringView.addGestureRecognizer(tapToScrollDown)
        
        bottomBar.alpha = 0
        shimmeringView.alpha = 0
        
        setupShimmeringView()
        addDotsToView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if needsDisplayIntro {
            showStartViewController()
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Views Configuration
    
    func addDotsToView() {
        baseScrollView.addSubview(greetingsView)
    
        for dotView in dotViews {
            baseScrollView.addSubview(dotView)
        }
        
        baseScrollView.addSubview(line)
        baseScrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * CGFloat(dotViews.count + 1))
    }
    
    func setupShimmeringView() {
        shimmeringView.contentView = aboutMeArrow
        shimmeringView.shimmering = true
        shimmeringView.shimmeringPauseDuration = 0.4
        shimmeringView.shimmeringAnimationOpacity = 0.1
        shimmeringView.shimmeringOpacity = 1.0
        shimmeringView.shimmeringSpeed = 20
        shimmeringView.shimmeringHighlightLength = 1.0
        shimmeringView.shimmeringDirection = .Right
        shimmeringView.shimmeringBeginFadeDuration = 0.1
        shimmeringView.shimmeringEndFadeDuration = 0.3
    }
    
    // MARK: - Navigation
    
    func showStartViewController() {
        let startViewController = storyboard!.instantiateViewControllerWithIdentifier("StartViewController") as! StartViewController
        startViewController.setNeedsDisplayIntro = { [unowned self] in
            self.needsDisplayIntro = false
        }
        
        presentViewController(startViewController, animated: false, completion: nil)
    }

}

extension DotsViewController: UIScrollViewDelegate {

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let yOffsetMin: CGFloat = view.bounds.height
        let yOffsetMax = self.view.bounds.height * CGFloat(dotViews.count)
        
        if yOffset > yOffsetMin && yOffset < yOffsetMax {
            let yOffsetWithoutGreetingsView = yOffset - greetingsView.frame.size.height
            updateLineFrameBasedOnOffset(yOffsetWithoutGreetingsView)
        }
        
        let fractionalPage = yOffset / view.bounds.height
        currentPage = lroundf(Float(fractionalPage))
    }
    
    // MARK: - Scroll Effects Helpers
    
    func updateLineFrameBasedOnOffset(yOffset: CGFloat) {
        var newFrame = line.frame
        newFrame.size = CGSize(width: newFrame.size.width, height: yOffset)
            
        UIView.animateWithDuration(0.5, animations: { [unowned self] () -> Void in
            self.line.frame = newFrame
        })
    }
    
    func scrollToFirstDot() {
        baseScrollView.setContentOffset(CGPoint(x: 0.0, y: view.bounds.height), animated: true)
    }
    
}
