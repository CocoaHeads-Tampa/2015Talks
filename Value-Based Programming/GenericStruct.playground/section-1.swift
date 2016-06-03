// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct POI {
    let latitude:Double
    let longitude:Double
    let name:String
    let address:String
    let city:String
    let state:String
}

struct DataBuffer<T> {

    let buffer:[T]
    let maxElements:Int
    let first:Int
    let last:Int
    
    init(maxElements:Int) {
        self.maxElements = maxElements
        self.buffer = []
    }
    
    
}