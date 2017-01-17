//
//  Weather.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _date: String!
    private var _cityName: String!
    private var _weatherType: String!
    private var _currentTemp: String!
    
    var date: String {
        
        if _date == nil {
            
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        
        return _date
    }
    
    var cityName: String {
        
        if _cityName == nil {
            
            return ""
        }
        
        return _cityName
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            
            return ""
        }
        
        return _weatherType
    }
    
    var currentTemp: String {
        
        if _currentTemp == nil {
            
            return ""
        }
        
        return _currentTemp
    }
    
    // Amalofire work here
    
    func downlaodWheatherData(completed: DownloadComplete) {
        
        Alamofire.request(CURRENTWEAHTER_URL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                    self._cityName = name
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        
                        let weahterType = main.capitalized
                        
                        self._weatherType = weahterType
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Double> {
                    
                    if let temp = main["temp"] {
                        
                        let kelvinToFarhenheitPreDivision = (temp * (9/5) - 459.67)
                        let kelvinToFarhenheit = Double(round(10 * kelvinToFarhenheitPreDivision / 10))
                        
                        self._currentTemp = "\(kelvinToFarhenheit)"
                    }
                }
            }
            
            //            print("Today is: \(self.date)")
            //            print("city name: \(self.cityName)")
            //            print("weather type: \(self.weatherType)")
            //            print("current weather temp: \(self.currentTemp)")
        }
        
        completed()
    }
    
}
