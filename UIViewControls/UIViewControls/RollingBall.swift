//
//  RollingBall.swift
//  UIViewControls
//
//  Created by Mettamdaica0909 on 9/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class RollingBall: UIViewController {
    var center: CGPoint?
    var _timer: NSTimer?
    var _alpha: CGFloat = 0.0
    var _deltaAlpha: CGFloat = 0.0
    var _x: CGFloat = 0.0
    var _y: CGFloat = 0.0
    var ball: UIImageView?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width / 6.0, size.height / 2.0)
        
        ball = UIImageView(image: UIImage(named: "football.png"))
        ball?.center = center!
        
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Roll", forState: UIControlState.Normal)
        button.addTarget(self, action: "RollingBall:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(ball!)
        self.view.addSubview(button)
    }
    func RollingBall(button: UIButton) {
        _x = self.ball!.center.x
        _y = self.ball!.center.y
        _alpha = 0
        _deltaAlpha = 0.1
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self,            selector: "animateBall:", userInfo: nil, repeats: true)
        self._timer?.fire()

    }
    
    func animateBall(timer: NSTimer) {
        _alpha += _deltaAlpha
        self.ball?.transform = CGAffineTransformMakeRotation(_alpha)
        _x += 32 * _deltaAlpha
        self.ball?.center = CGPointMake(_x, _y)
    }
}
