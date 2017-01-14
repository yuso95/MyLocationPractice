//
//  Constants.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q=Boston,ma&"
let APPID_URL = "appid="
let API_KEY = "01b71ce9d42eae12344cd64ff899d22c"

let CURRENTWEAHTER_URL = "\(BASE_URL)\(APPID_URL)\(API_KEY)"

