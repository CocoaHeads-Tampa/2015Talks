import Foundation

func leapYear(year:Int, month:Int, day:Int) -> Bool {
    var rv:Bool = false
    if year%4 == 0 {
        if year%100 != 0 {
            rv = true
        }
        else if year%400 == 0 {
            rv = true
        }
    }
    return rv
}

func numberOfDaysInMonth(year:Int, month:Int) -> Int {
    return 1
}

func dayOfWeekForDate(year:Int, month:Int, day:Int) -> Int {
    return 1
}

func daysSinceEpochForDate(year:Int, month:Int, day:Int) -> Int {
    return 1
}

struct Date {

    let month:Int
    let day:Int
    let year:Int

    let isLeapYear:Bool
    let daysInMonth:Int
    let dayOfWeek:Int
//    let daysSinceEpoch:Int
    
    init(m:Int, d:Int, y:Int) {
    
        month = m
        day = d
        year = y
        
        // now compute leap year, days in month and day of week
        isLeapYear = leapYear(y,m,d)
        daysInMonth = numberOfDaysInMonth(y,m)
        dayOfWeek = dayOfWeekForDate(y,m,d)
//        daysSinceEpoch = daysSinceEpochForDate(daysSinceEpoch(y, m, d)
    }
}

let d1:Date = Date(m: 12, d: 5, y: 2002)


