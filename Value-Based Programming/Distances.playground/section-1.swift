// Playground - noun: a place where people can play

import Foundation
import CoreLocation

struct Location {

    let latitude:Double
    let longitude:Double
    let name:String
    let tags:[String]
    
    init(lat:Double, lon:Double, nm:String, tags:[String]) {
        self.latitude = lat
        self.longitude = lon
        self.name = nm
        self.tags = tags
    }
    
//    init(json:String) {
//    }
    
//    func metersFrom(loc:Location) -> Float {
//    }
//    
//    func milesFrom(loc:LangCode) -> Float {
//    }
    
}
