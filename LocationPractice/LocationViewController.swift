//
//  LocationViewController.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    // Variables/Constants/Computed Properties
    
    var weather = Weather()
    // Outlets
    
    @IBOutlet private weak var dateLBL: UILabel!
    @IBOutlet private weak var cityLBL: UILabel!
    @IBOutlet private weak var currentWeatherTypeLBL: UILabel!
    @IBOutlet private weak var currentTempLBL: UILabel!
    @IBOutlet private weak var currentWheatherTypeIMG: UIImageView!
    // Actions

    override func viewDidLoad() {
        super.viewDidLoad()

        weather.downlaodWheatherData {
            
            updateUI()
        }
    }

    private func updateUI() {
        
        dateLBL.text = weather.date
        cityLBL.text = weather.cityName
        currentWeatherTypeLBL.text = weather.weatherType
        currentTempLBL.text = "\(weather.currentTemp)"
    }

}

