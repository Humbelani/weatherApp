//
//  City.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

class City {
    
    private var _cityName: String!
    private var _weatherType: String!
    private var _minTemp: String!
    private var _maxTemp: String!
    private var _weatherDescr: String!
    private var _wind: Double!
    private var _clouds: Double!
    
    var cityName: String {
        return _cityName ?? ""
    }
    
    var weatherType: String{
        return _weatherType ?? ""
    }
    
    var minTemp: String {
        return _minTemp ?? ""
    }
    
    var maxTemp: String{
        return _maxTemp ?? ""
    }
    
    var weatherDescr: String{
        return _weatherDescr ?? ""
    }
    
    var wind: Double {
        return _wind ?? 0.0
    }
    
    var clouds: Double{
        return _clouds ?? 0.0
    }
    
    init(cityDict: StringToAnyObjectDictionary) {
        
        if let name = cityDict["name"] as? String {
            _cityName = name
        }
        
        if let weather = cityDict["weather"] as? [StringToAnyObjectDictionary] {
            if let main = weather[0]["main"] as? String {
                _weatherType = main
            }
        }
        
        if let temp = cityDict["main"] as? StringToAnyObjectDictionary {
            if let min = temp["temp_min"] as? Double {
                let kelvinToCelcius = (min - 273.15)
                _minTemp = "\(kelvinToCelcius)"
            }
            
            if let max = temp["temp_max"] as? Double {
                let kelvinToCelcius = (max - 273.15)
                _maxTemp = "\(kelvinToCelcius)"
            }
        }
        
        if let descr = cityDict["weather"] as? [StringToAnyObjectDictionary] {
            if let weatherDescr = descr[0]["description"] as? String {
                _weatherDescr = weatherDescr
            }
        }
        
        if let windDict = cityDict["wind"] as? StringToAnyObjectDictionary {
            if let speed = windDict["speed"] as? Double {
                _wind = speed
            }
        }
        
        if let cloudsDict = cityDict["clouds"] as? StringToAnyObjectDictionary {
            if let clouds = cloudsDict["all"] as? Double {
                _clouds = clouds
            }
        }
    }
}
