//
//  DateExtension.swift
//  Timely
//
//  Created by Mac on 2020/6/18.
//  Copyright © 2020 Martin. All rights reserved.
//

extension Date
{
    /**
    將Date轉換為台北時區 
    */
    func date2TaipeiDate(date:Date) -> Date
    {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: date))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: date) else {return Date()}
        return localDate
    }
    
    /**
     取得當地時間
     */
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}
        return localDate
    }
    
    /**
     取得輸入Date與現在時間相差的時分秒
     */
    func compareCurrntTimeComponents(date:Date) -> DateComponents
    {
        let nowdate = Date().localDate()
        let compareComponents = CommonFunction.getCalendar().dateComponents([.hour, .minute, .second], from: nowdate, to: date)
        return compareComponents
    }
    
    /**
     取得輸入Date與現在時間相差的時分(返回文字)
     */
    func compareCurrntTime(start:Date,end:Date) -> (hour:String, minute:String)
    {
        let nowdate = Date().localDate()
        
//        let compareStartDate = CommonFunction.getCalendar().dateComponents([.hour, .minute], from: nowdate, to: start)
        
        var hour : Int!
        var minute : Int!
        
//        if compareStartDate.hour!<0 || compareStartDate.minute!<0
//        {
//            hour = compareStartDate.hour!
//            minute = abs(compareStartDate.minute!)
//        }
//        else
//        {
            let compareEndDate = CommonFunction.getCalendar().dateComponents([.hour, .minute], from: nowdate, to: end)
            hour = compareEndDate.hour!
            minute = compareEndDate.minute! + 1
            if minute == 60 {
                hour += 1
                minute = 0
            }
//        }
        let hourText = String(format: "%02d", hour)
        let minuteText = String(format: "%02d", minute)
        return (hour:hourText, minute:minuteText)
        
        /*
        let compareComponents = CommonFunction.getCalendar().dateComponents([.hour, .minute], from: nowdate, to: end)
        var hour = compareComponents.hour!
        var minute = compareComponents.minute! + 1
        if minute == 60 {
            hour += 1
            minute = 0
        }
        let hourText = String(format: "%02d", hour)
        let minuteText = String(format: "%02d", minute)
        return (hour:hourText, minute:minuteText)
        */
    }
    
    /**
    將Date轉換為輸入格式的文字
    */
    func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.timeZone = TimeZone(identifier: "Asia/Taipei")
        let resultdate = formatter.string(from: date)
        return resultdate
    }
}
