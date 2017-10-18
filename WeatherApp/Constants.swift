//
//  Constants.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()
typealias StringToAnyObjectDictionary = Dictionary<String,AnyObject>

class Constants {
    
    struct Parameter {
        static var latitude = -26.107567
        static var longitude = 28.056702
        static let appId = "&appid=2c3f8839952cfe1b30f4d8d720429759"
    }
    
    struct CurrentWeather {
        static let url = "http://api.openweathermap.org/data/2.5/weather?lat=\(Constants.Parameter.latitude)&lon=\(Constants.Parameter.longitude)\(Constants.Parameter.appId)"
    }
    
    struct Forecast {
        static let url = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Constants.Parameter.latitude)&lon=\(Constants.Parameter.longitude)\(Constants.Parameter.appId)"
    }
    
    struct Cities {
        static let url = "http://api.openweathermap.org/data/2.5/find?lat=-26.093611&lon=28.006390&cnt=50\(Constants.Parameter.appId)"
    }
}
