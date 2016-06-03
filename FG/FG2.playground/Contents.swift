//: Playground - noun: a place where people can play

import UIKit

func drawMeInFrame(f:CGRect)(s:UIColor)(l:UIColor) {
}

let dm1 = drawMeInFrame(CGRect(x: 0, y: 0, width: 100, height: 20))
let dm2 = dm1(s: UIColor.whiteColor())
let dm3:() = dm2(l: UIColor.darkGrayColor())
