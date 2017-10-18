//
//  Forecast.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var date = ""
    var weatherType = ""
    var highTemp = ""
    var lowTemp = ""
    
    init(weatherDict: StringToAnyObjectDictionary) {
        if let temp = weatherDict["temp"] as? StringToAnyObjectDictionary {
            if let min = temp["min"] as? Double {
                let kelvinToCelcius = (min - 273.15)
                self.lowTemp = "\(kelvinToCelcius)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelcius = (max - 273.15)
                self.highTemp = "\(kelvinToCelcius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [StringToAnyObjectDictionary], let main = weather[0]["main"] as? String {
                self.weatherType = main
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self.date = unixConvertedDate.dayOfTheWeek()
        }
    }
}
