//
//  LocationViewController.swift
//  LocationPractice
//
//  Created by Younoussa Ousmane Abdou on 1/12/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit
import Alamofire

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private struct MyStoryBoard {
        
        static let tableViewCellID = "ForecastCell"
    }
    
    // Variables/Constants/Computed Properties
    
    var weather = Weather()
    var forecasts = [Forecast]()
    // Outlets
    
    @IBOutlet private weak var dateLBL: UILabel!
    @IBOutlet private weak var cityLBL: UILabel!
    @IBOutlet private weak var currentWeatherTypeLBL: UILabel!
    @IBOutlet private weak var currentTempLBL: UILabel!
    @IBOutlet private weak var currentWheatherTypeIMG: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    // Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        weather.downlaodWheatherData {
            
            downloadForecastData {
                
                updateUI()
            }
        }
    }
    
    private func updateUI() {
        
        dateLBL.text = weather.date
        cityLBL.text = weather.cityName
        currentWeatherTypeLBL.text = weather.weatherType
        currentTempLBL.text = "\(weather.currentTemp)"
        
        print("Today is: \(dateLBL.text!)")
        print("city name: \(cityLBL.text!)")
        print("weather type: \(currentTempLBL.text!)")
        print("current weather temp: \(currentTempLBL.text!)")
    }
    
    //Alamofire
    
    func downloadForecastData(complete: DownloadComplete) {
        
        Alamofire.request(ForecastWeather_URL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for object in list {
                        
                        let aForecast = Forecast(weahterDict: object)
                        self.forecasts.append(aForecast)
                        
                    }
                    
                    self.forecasts.removeFirst()
                    print("ForecastCount: \(self.forecasts.count)")
                    self.tableView.reloadData()
                }
            }
        }
        
        complete()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MyStoryBoard.tableViewCellID) as? ForecastCell {
            
            let eachForecast = forecasts[indexPath.row]
            
            cell.configureCell(forecast: eachForecast)
            
            return cell
        } else {
            
            return ForecastCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}

