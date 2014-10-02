//
//  StraillingStar.swift
//  UIViewControls
//
//  Created by Mettamdaica0909 on 9/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class StraillingStar: UIViewController {
    let MAX_HEIGHT = CGFloat(150)
    let X = CGFloat(160)
    var red, violet, brown, green: UIImageView?
    var _timer: NSTimer?
    var _alpha: Double!
    var x: CGFloat = 0.0
    var x1: CGFloat = 0.0
    var x2: CGFloat = 0.0
    var x3: CGFloat = 0.0
    var y: CGFloat = 0.0
    var y1: CGFloat = 0.0
    var y2: CGFloat = 0.0
    var y3: CGFloat = 0.0
    var half_screen_height: Double!
    var step: Int = 0
//    let MAX_HEIGHT = CGFloat(100)
//    let X = CGFloat(160)
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        red = UIImageView(image: UIImage(named: "red.png"))
        violet = UIImageView(image: UIImage(named: "violet.png"))
        brown = UIImageView(image: UIImage(named: "brown.png"))
        green = UIImageView(image: UIImage(named: "green.png"))
        configureInitialPosition()
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Animation", forState: UIControlState.Normal)
        button.addTarget(self, action: "startAnimation:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(red!)
        self.view.addSubview(violet!)
        self.view.addSubview(brown!)
        self.view.addSubview(green!)
        self.view.addSubview(button)
    }
    func configureInitialPosition() {
        half_screen_height = 160
        x = 0
        step = 0
    }
    

    
    func startAnimation(button: UIButton) {
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animateStar:", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func animateStar(timer: NSTimer) {
        y = self.scaleSin(x)
        self.red!.center = CGPointMake(x, y)
        x += 4
        
        x1 = x - 4 * 5
        y1 = self.scaleSin(x1)
        self.green!.center = CGPointMake(x1, y1)

        x2 = x1 - 4 * 5
        y2 = self.scaleSin(x2)
        self.violet!.center = CGPointMake(x2, y2)
        
        x3 = x2 - 4 * 5
        y3 = self.scaleSin(x3)
        self.brown!.center = CGPointMake(x3, y3)
        
        step++
    }
    
    func scaleSin(input: CGFloat) -> CGFloat {
        return self.MAX_HEIGHT + self.MAX_HEIGHT * sin(input * CGFloat(M_PI) / self.X)
    }

}
