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
    var dotNode1: DotView!
    var dotNode2: DotView!
    var dotNode3: DotView!
    var dot1: UIView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dotNode1 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as! DotView
        dotNode2 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as! DotView
        dotNode3 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as! DotView
        dot1 = dotNode1!.dot
        
        println("VIEW BOUNDS: \(self.view.bounds.width)")
        
        println("DOT1 CENTER Y: \(dot1.center.y)")
        
        dotNode1!.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height)
        dotNode2!.frame = CGRect(x: 0.0, y: dotNode1!.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height)
        dotNode3!.frame = CGRect(x: 0.0, y: dotNode1!.bounds.height * 2, width: self.view.bounds.width, height: self.view.bounds.height)
        
        self.view.layoutIfNeeded()
        
        println("DOT1 CENTER Y: \(dot1.center.y)")
        
        line = UIView(frame: CGRect(x: dot1.center.x - 5.0, y: self.view.bounds.height / 2, width: 10.0, height: 0))
        line.backgroundColor = UIColor.blackColor()
        line.layer.cornerRadius = 5.0
        
        baseScrollView.addSubview(dotNode1!)
        baseScrollView.addSubview(dotNode2!)
        baseScrollView.addSubview(dotNode3!)
        baseScrollView.addSubview(line)
        
        println(dotNode1!.frame)
        println(dotNode2!.frame)
        
        baseScrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height * 3)
        
        println(self.baseScrollView.contentSize)
        
        dotNode1.storyDescription.text = "I left the job that was my dream job in the past. I was looking for new experiences, looking for a job where I can really make the difference."
        
        
        let shadowPath = UIBezierPath(rect: bottomBar.bounds)
        bottomBar.layer.masksToBounds = false
        bottomBar.layer.shadowColor = UIColor.blackColor().CGColor
        bottomBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        bottomBar.layer.shadowOpacity = 0.3
        bottomBar.layer.shadowPath = shadowPath.CGPath
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        println("VIEW BOUNDS: \(self.view.bounds.width)")
//        
//        println(dotNode1.storyDescription.frame)
//        
        dotNode1.storyDescription.setNeedsLayout()
        dotNode1.storyDescription.layoutIfNeeded()
        dotNode1.storyContainerHeightConstraint.constant = dotNode1.storyDescription.frame.origin.y + dotNode1.storyDescription.frame.size.height + 8.0
//
//        println(dotNode1.storyDescription.frame)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        println("DOT1 CENTER Y when appaer: \(dot1.center.y)")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

extension DotsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset = scrollView.contentOffset.y
        
        println("   OFFSET: \(yOffset)")
        
        if yOffset > 0 && yOffset < self.view.bounds.height * 2 {
            var newFrame = line.frame
            
            let fractional = Float(yOffset / self.view.bounds.height)
            
            println("PAGINA: \(lroundf(fractional))")
            
            switch lroundf(fractional) {
            case 2:
                newFrame.size = CGSize(width: newFrame.size.width, height: scrollView.contentOffset.y)
            default:
                newFrame.size = CGSize(width: newFrame.size.width, height: scrollView.contentOffset.y)
            }
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.line.frame = newFrame
                }) { (finished) -> Void in
                    
            }
        }
    }
    
}
