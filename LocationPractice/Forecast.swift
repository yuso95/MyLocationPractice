//
//  Forecast.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/17/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _hightTemp: String!
    private var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            
            return ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            
            return ""
        }
        
        return _weatherType
    }
    
    var highTemp: String {
        if _hightTemp == nil {
            
            return ""
        }
        
        return _hightTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            
            return ""
        }
        
        return _lowTemp
    }
    
    init(weahterDict: Dictionary<String, AnyObject>) {
        
        if let dt = weahterDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            _date = unixConvertedDate.dayOfTheWeek()
            
//            print(date)
        }
        
        if let weather = weahterDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                _weatherType = main
                
//                print(weatherType)
            }
        }
        
        if let temp = weahterDict["temp"] as? Dictionary<String, AnyObject> {
            if let max = temp["max"] as? Double {
                
                let kelvinToFarhenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                _hightTemp = "\(kelvinToFarhenheit)"
                
//                print(highTemp)
                
            }
            
            if let min = temp["min"] as? Double {
                
                let kelvinToFarhenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                _lowTemp = "\(kelvinToFarhenheit)"
                
//                print(lowTemp)
            }
        }
    }
}

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
