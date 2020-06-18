//
//  CommonFunction.swift
//  Timely
//
//  Created by Mac on 2020/6/12.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class CommonFunction: NSObject {

    static public func getCalendar() -> Calendar {
        // *** create calendar object ***
        var calendar = Calendar.current
        // *** define calendar components to use as well Timezone to UTC ***
        calendar.timeZone = TimeZone(identifier: "Asia/Taipei")!
        return calendar
    }
    
    static public func getHour() -> String {
        let number = getCalendar().component(.hour, from: Date())
        return String(format: "%02d", number)
    }
    static public func getMinute() -> String {
        let number = getCalendar().component(.minute, from: Date())
        return String(format: "%02d", number)
    }
    static public func getSecond() -> String {
        let number = getCalendar().component(.second, from: Date())
        return String(format: "%02d", number)
    }
}


