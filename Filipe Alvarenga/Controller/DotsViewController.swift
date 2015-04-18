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
    var line: UIView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dotNode1 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as? UIView
        let dotNode2 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as? UIView
        let dotNode3 = NSBundle.mainBundle().loadNibNamed("DotView", owner: self, options: nil)[0] as? UIView
        let dot1 = dotNode1!.viewWithTag(100)!
        
        line = UIView(frame: CGRect(x: dot1.center.x - 5.0, y: dot1.center.y, width: 10.0, height: 0))
        line.backgroundColor = UIColor.blackColor()
        line.layer.cornerRadius = 5.0
        
        dotNode2!.frame = CGRect(x: 0.0, y: dotNode1!.bounds.height, width: dotNode2!.bounds.width, height: dotNode2!.bounds.width)
        dotNode3!.frame = CGRect(x: 0.0, y: dotNode1!.bounds.height * 2, width: dotNode3!.bounds.width, height: dotNode3!.bounds.width)
        
        baseScrollView.addSubview(dotNode1!)
        baseScrollView.addSubview(dotNode2!)
        baseScrollView.addSubview(dotNode3!)
        baseScrollView.addSubview(line)
        
        println(dotNode1!.frame)
        println(dotNode2!.frame)
        
        baseScrollView.contentSize = CGSize(width: self.view.bounds.width, height: dotNode1!.bounds.height * 3)
        
        println(self.baseScrollView.contentSize)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

extension DotsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset = scrollView.contentOffset.y
        
        if yOffset > 0 {
            var newFrame = line.frame
            
            let fractional = Float(yOffset / self.view.bounds.height)
            
            println("PAGINA: \(lroundf(fractional))")
            
            switch lroundf(fractional) {
            case 2:
                newFrame.size = CGSize(width: newFrame.size.width, height: scrollView.contentOffset.y + 67.0)
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
