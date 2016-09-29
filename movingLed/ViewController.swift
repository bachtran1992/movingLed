//
//  ViewController.swift
//  movingLed
//
//  Created by iOS Student on 9/28/16.
//  Copyright © 2016 iOS Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lastonLed = -1
    var n = 5;
    var _margin: CGFloat = 40
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRowOfBall()
        
        let timer = Timer.scheduledTimer(timeInterval: 0.1,target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        
        
    }
    
    func runningLed()
    {
        if (lastonLed != -1)
        {
            turnOffLed()
        }
        if (lastonLed != n-1)
        {
            lastonLed = lastonLed + 1
        }
        else if ( lastonLed == n - 1)
        {       n = n - 1
                lastonLed = lastonLed - 1
        }
        if ( n == 0)
        {
            n = Int(RETURN)
        }
        
        turnOnLed()
        
    }
    func turnOnLed()
    {
        if let ball = self.view.viewWithTag(100 + lastonLed) as? UIImageView
        {
            ball.image = UIImage(named: "green")
        }
    }
    func turnOffLed()
    {
        if let ball = self.view.viewWithTag(100 + lastonLed) as? UIImageView
        {
            ball.image = UIImage(named: "grey")
        }
    }
    func drawRowOfBall(){
        for indexHang in 0..<n {
            for indexCot in 0..<n {
                print(index)
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPoint(x: _margin + CGFloat(indexHang) * spaceBetweenBall(), y: CGFloat(indexCot)*50 + _margin)
                ball.tag = indexHang + 100
                self.view.addSubview(ball)
            }
            
        }
    }
    func spaceBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
        return space
    }
    
    
}


    
    


