//: Playground - noun: a place where people can play

import UIKit

// drawing closure
typealias MyDrawingCode = (frame:CGRect, strokeColor:UIColor, fillColor:UIColor) -> Void

// instantiated drawing closures
var myRoundedRect:MyDrawingCode = {(frame:CGRect, strokeColor:UIColor, fillColor:UIColor) in
    strokeColor.setStroke()
    fillColor.setFill()
    let p:UIBezierPath = UIBezierPath(roundedRect: frame, cornerRadius: 8)
    p.fill()
    p.stroke()
}

var myOval:MyDrawingCode = {(frame:CGRect, strokeColor:UIColor, fillColor:UIColor) in
    strokeColor.setStroke()
    fillColor.setFill()
    let ovalFrame = CGRectInset(frame, 2, 2)
    let p:UIBezierPath = UIBezierPath(ovalInRect: ovalFrame)
    p.lineWidth = 5.0
    p.fill()
    p.stroke()
}

var myOvalAndRoundedRect:MyDrawingCode = {(frame:CGRect, strokeColor:UIColor, fillColor:UIColor) in

    var leftFrame = frame
    leftFrame.size.width = frame.size.width/2
    leftFrame.size.height = frame.size.height/4
    var rightFrame = frame
    rightFrame.size.width = frame.size.width/2
    rightFrame.origin.x = frame.size.width/2
    let p1:UIBezierPath = UIBezierPath(rect: frame)
    fillColor.setFill()
    p1.fill()
    
    myOval(frame: leftFrame, strokeColor: UIColor.redColor(), fillColor: UIColor.magentaColor())
    myRoundedRect(frame: rightFrame, strokeColor: UIColor.greenColor(), fillColor: UIColor.yellowColor())
}

var myFace:MyDrawingCode = {(frame:CGRect, strokeColor:UIColor, fillColor:UIColor) in

    var leftEyeFrame = frame
    leftEyeFrame.size.width = frame.size.width/2
    leftEyeFrame = CGRectInset(leftEyeFrame, 8.0, 16.0)
    
    var rightEyeFrame = frame
    rightEyeFrame.size.width = frame.size.width/2
    rightEyeFrame.origin.x = frame.size.width/2
    rightEyeFrame.origin.y = rightEyeFrame.origin.y - 8
    rightEyeFrame = CGRectInset(rightEyeFrame, 8.0, 16.0)
    
    var mouthFrame = frame
    mouthFrame = CGRectInset(mouthFrame, 8.0, 0.0 )
    
    mouthFrame.size.height = 5
    mouthFrame.origin.y = frame.origin.y + frame.size.height - 8
    
    let p1:UIBezierPath = UIBezierPath(rect: frame)
    fillColor.setFill()
    p1.fill()
    
    myOval(frame: leftEyeFrame, strokeColor: UIColor.redColor(), fillColor: UIColor.magentaColor())
    myOval(frame: rightEyeFrame, strokeColor: UIColor.greenColor(), fillColor: UIColor.yellowColor())
    myRoundedRect(frame: mouthFrame, strokeColor: UIColor.blueColor(), fillColor: UIColor.orangeColor())
}

// definitions for MPV
let pi = CGFloat(3.1415927)
let piOverTwo = CGFloat(pi / 2.0)
let twoPiOverThree = CGFloat(2.0 * pi / 3.0)
let twoPi = CGFloat(pi * 2.0)

class MPV : UIView {
    
    var contentFrame:CGRect = CGRectZero
    var anchorPoint:CGPoint = CGPointZero
    var drawingCode:MyDrawingCode?
    
    convenience init(frame:CGRect, theDrawingCode:MyDrawingCode? ) {
        self.init(frame: frame)
        var contentFrame = frame
        var wholeFrame = frame
        
        self.contentFrame = contentFrame
        
        drawingCode = theDrawingCode
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        var p:UIBezierPath = UIBezierPath()

        let c0 = CGPoint(x:contentFrame.origin.x, y:contentFrame.origin.y)
        let c1 = CGPoint(x:contentFrame.origin.x + contentFrame.size.width, y: contentFrame.origin.y)
        let c2 = CGPoint(x:contentFrame.origin.x + contentFrame.size.width, y: contentFrame.origin.y + contentFrame.size.height)
        let c3 = CGPoint(x:contentFrame.origin.x, y: contentFrame.origin.y + contentFrame.size.height)
        
        p.moveToPoint(c0)
        p.addLineToPoint(c1)
        p.addLineToPoint(c2)
        p.addLineToPoint(c3)
        p.addLineToPoint(c0)
        
        UIColor.brownColor().setStroke()
        p.stroke()
        
        if let drawClosure = drawingCode {
            drawClosure(frame: contentFrame, strokeColor: UIColor.darkGrayColor(), fillColor: UIColor.lightGrayColor())
        }
    }
}

let v1 = MPV(frame:CGRect(x: 0, y: 0, width: 100, height: 64), theDrawingCode:myOvalAndRoundedRect)
let v2 = MPV(frame:CGRect(x: 0, y: 0, width: 100, height: 64), theDrawingCode:myFace)
let v3 = MPV(frame:CGRect(x: 0, y: 0, width: 100, height: 120), theDrawingCode:myFace)
