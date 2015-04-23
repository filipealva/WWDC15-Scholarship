//
//  DotsViewController.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 17/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

class DotsViewController: UIViewController {

    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var bottomBar: UIView!
    var line: UIView!
    
    lazy var dotViews: [DotView] = {
        map(enumerate(self.stories)) { (index, story) in
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
        
        baseScrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * CGFloat(dotViews.count))
    }

}

extension DotsViewController: UIScrollViewDelegate {

//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        var yOffset = scrollView.contentOffset.y
//        
//        println("   OFFSET: \(yOffset)")
//        
//        if yOffset > 0 && yOffset < self.view.bounds.height * 2 {
//            var newFrame = line.frame
//            
//            let fractional = Float(yOffset / self.view.bounds.height)
//            
//            println("PAGINA: \(lroundf(fractional))")
//            
//            switch lroundf(fractional) {
//            case 2:
//                newFrame.size = CGSize(width: newFrame.size.width, height: scrollView.contentOffset.y)
//            default:
//                newFrame.size = CGSize(width: newFrame.size.width, height: scrollView.contentOffset.y)
//            }
//            
//            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.line.frame = newFrame
//                }) { (finished) -> Void in
//                    
//            }
//        }
//    }
    
}
