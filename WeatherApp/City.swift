//
//  City.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

class City {
    
    var cityName = ""
    var weatherType = ""
    var minTemp = ""
    var maxTemp = ""
    var weatherDescription = ""
    var wind = 0.0
    var clouds = 0.0
    
    init(cityDict: StringToAnyObjectDictionary) {
        
        if let name = cityDict["name"] as? String {
            self.cityName = name
        }
        
        if let weather = cityDict["weather"] as? [StringToAnyObjectDictionary], let main = weather[0]["main"] as? String {
                self.weatherType = main
        }
        
        if let temp = cityDict["main"] as? StringToAnyObjectDictionary {
            if let min = temp["temp_min"] as? Double {
                let kelvinToCelcius = (min - 273.15)
                self.minTemp = "\(kelvinToCelcius)"
            }
            
            if let max = temp["temp_max"] as? Double {
                let kelvinToCelcius = (max - 273.15)
                self.maxTemp = "\(kelvinToCelcius)"
            }
        }
        
        if let descr = cityDict["weather"] as? [StringToAnyObjectDictionary], let weatherDescription = descr[0]["description"] as? String {
                self.weatherDescription = weatherDescription
        }
        
        if let windDict = cityDict["wind"] as? StringToAnyObjectDictionary, let speed = windDict["speed"] as? Double {
                self.wind = speed
        }
        
        if let cloudsDict = cityDict["clouds"] as? StringToAnyObjectDictionary, let clouds = cloudsDict["all"] as? Double  {
                self.clouds = clouds
        }
    }
}
