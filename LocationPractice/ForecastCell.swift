//
//  ForecastCell.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/17/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    @IBOutlet private weak var weatherTypeIMG: UIImageView!
    @IBOutlet private weak var dateLBL: UILabel!
    @IBOutlet private weak var weatherTypeLBL: UILabel!
    @IBOutlet private weak var highTempLBL: UILabel!
    @IBOutlet private weak var lowTempLBL: UILabel!

    func configureCell(forecast: Forecast) {
        
        weatherTypeIMG.image = UIImage(named: "\(forecast.weatherType)")
        dateLBL.text = forecast.date
        weatherTypeLBL.text = forecast.weatherType
        highTempLBL.text = forecast.highTemp
        lowTempLBL.text = forecast.lowTemp
    }
    
}
