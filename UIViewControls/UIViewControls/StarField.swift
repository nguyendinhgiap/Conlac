//
//  StarField.swift
//  UIViewControls
//
//  Created by ios25 on 9/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class StarField: UIViewController {
    var red, violet, brown, green: UIImageView?
    var center: CGPoint!
    let deltaX = CGFloat(100)
    let deltaY = CGFloat(100)
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None

        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width / 2.0, size.height / 2.0)
        red = UIImageView(image: UIImage(named: "red.png"))
        violet = UIImageView(image: UIImage(named: "violet.png"))
        brown = UIImageView(image: UIImage(named: "brown.png"))
        green = UIImageView(image: UIImage(named: "green.png"))
        
        self.vitri()
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Animate", forState: UIControlState.Normal)
        button.addTarget(self, action: "Animate:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(red!)
        self.view.addSubview(violet!)
        self.view.addSubview(brown!)
        self.view.addSubview(green!)
    }
    func Animate(button: UIButton) {
        UIView.animateWithDuration(1, animations: {
            self.brown!.center = CGPointMake(self.center.x - 100, self.center.y - 100)
            self.red!.center = CGPointMake(self.center.x + self.deltaX, self.center.y + self.deltaY)
            self.green!.center = CGPointMake(self.center.x + self.deltaX, self.center.y - self.deltaY)
            self.violet!.center = CGPointMake(self.center.x - self.deltaX, self.center.y + self.deltaY)
            }, completion: { (finished: Bool) in
                UIView.animateWithDuration(1, animations: {
                    self.brown!.center = CGPointMake(self.center.x - self.deltaX, self.center.y)
                    self.green!.center = CGPointMake(self.center.x, self.center.y - self.deltaY)
                    self.red!.center = CGPointMake(self.center.x + self.deltaX, self.center!.y)
                    self.violet!.center = CGPointMake(self.center.x, self.center.y + self.deltaY)
                    }, completion: { (finished: Bool) in
                        UIView.animateWithDuration(3, animations: {
                            self.vitri()
                            }, completion: { (finished: Bool) in
                                
                        })
                })
        })
    }
    func vitri() {
        red!.center = center
        violet!.center = center
        brown!.center = center
        green!.center = center
    }
}
