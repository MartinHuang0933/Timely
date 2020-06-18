//
//  DateExtension.swift
//  Timely
//
//  Created by Mac on 2020/6/18.
//  Copyright © 2020 Martin. All rights reserved.
//

extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}
        return localDate
    }
    
    func compareCurrntTimeComponents(date:Date) -> DateComponents
    {
        let nowdate = Date().localDate()
        let compareComponents = CommonFunction.getCalendar().dateComponents([.hour, .minute, .second], from: nowdate, to: date)
        return compareComponents
    }
    
    func compareCurrntTime(date:Date) -> (hour:String, minute:String)
    {
        let nowdate = Date().localDate()
        let compareComponents = CommonFunction.getCalendar().dateComponents([.hour, .minute], from: nowdate, to: date)
        //根据时间差 做所对应的文字描述 (作为返回文字描述)
        let hourText = String(format: "%02d", compareComponents.hour!)
        let minuteText = String(format: "%02d", compareComponents.minute!+1)
        return (hour:hourText, minute:minuteText)
    }
}
