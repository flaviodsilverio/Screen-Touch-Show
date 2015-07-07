//
//  touchShow.swift
//  windowSubclass
//
//  Created by Flávio Silvério on 05/07/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class touchShow: UIApplication {

    var touchView : UIView = UIView()
    
    override func sendEvent(event: UIEvent) {
        super.sendEvent(event)
        
        //var touches = event.allTouches()
        //touches?.first.
    }
    

    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        
        var currentTouch = touches.first
       // print(currentTouch)
        
        var location : CGPoint = (currentTouch as! UITouch).locationInView(UIApplication.sharedApplication().keyWindow)
        createView(location)
        
        UIApplication.sharedApplication().keyWindow?.addSubview(touchView)
       // print(location)
      //  var currentTouch: AnyObject? = (event.allTouches() as! NSSet<NSObject>).anyObject()
      //  print(currentTouch)
    }
    
     override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        
        var currentTouch = touches.first
        // print(currentTouch)
        
        var location : CGPoint = (currentTouch as! UITouch).locationInView(UIApplication.sharedApplication().keyWindow)
        createView(location)
        
        UIApplication.sharedApplication().keyWindow?.addSubview(touchView)
    }
    
    override func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesCancelled(touches, withEvent: event)
        touchView.removeFromSuperview()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        touchView.removeFromSuperview()

    }
    
    func createView(location: CGPoint){
        
        touchView.frame = CGRectMake(location.x - 25, location.y - 25, 50, 50)
        touchView.backgroundColor = UIColor.grayColor()
        touchView.layer.cornerRadius = touchView.frame.size.height/2
        touchView.alpha = 0.5
        touchView.layer.borderColor = UIColor.darkGrayColor().CGColor
        
    }
//    - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    // get touch event
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint pos = [touch locationInView: [UIApplication sharedApplication].keyWindow];
//    NSLog(@”Position of touch: %.3f, %.3f”, pos.x, pos.y);
}



