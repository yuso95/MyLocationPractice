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
    
    var date: String {
        
        if _date == nil {
            
            return ""
        }
        
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
    
    // Amalofire work here 
    
}
