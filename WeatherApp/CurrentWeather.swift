//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    private var _minTemp: Double!
    private var _maxTemp: Double!
    private var _humidity:Double!
    private var _windSpeed:Double!
    private var _cloudsCover:Double!
    private var _sunset:String!
    private var _sunrise:String!
    
    
    var cityName: String {
        return _cityName ?? ""
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        return _weatherType ?? ""
    }
    
    var currentTemp: Double {
        return _currentTemp ?? 0.0
    }
    
    var minTemp: Double {
        return _minTemp ?? 0.0
    }
    
    var maxTemp: Double {
        return _maxTemp ?? 0.0
    }
    
    var humidity: Double {
        return _humidity ?? 0.0
    }
    
    var wind: Double {
        return _windSpeed ?? 0.0
    }
    
    var cloudsCover: Double {
        return _cloudsCover ?? 0.0
    }
    
    var sunrise: String {
        return _sunrise ?? ""
    }
    
    var sunset: String {
        return _sunset ?? ""
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // initialize url to tell alamofire where to download data from
        
       // let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToCelcius = (currentTemperature - 273.15)
                        self._currentTemp = kelvinToCelcius
                        print(self._currentTemp)
                    }
                    
                    if let minTemp = main["temp_min"] as? Double {
                        let kelvinToCelcius = (minTemp - 273.15)
                        self._minTemp = kelvinToCelcius
                    }
                    
                    if let maxTemp = main["temp_max"] as? Double {
                        let kelvinToCelcius = (maxTemp - 273.15)
                        self._maxTemp = kelvinToCelcius
                    }
                    
                    if let humidity = main["humidity"] as? Double {
                        self._humidity = humidity
                    }
                    
                }
                
                if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = wind["speed"] as? Double {
                        self._windSpeed = speed
                    }
                }
                
                if let clouds = dict["clouds"] as? Dictionary<String, AnyObject> {
                    if let all = clouds["all"] as? Double {
                        self._cloudsCover = all
                    }
                }
                
                if let sys = dict["sys"] as? Dictionary<String, AnyObject> {
                    
                    let formatter = DateFormatter()
                    formatter.timeStyle = .short
                    formatter.dateStyle = .none
                    
                    if let sunset = sys["sunset"] as? Double {
                        let date = Date(timeIntervalSince1970: sunset)
                        self._sunset = formatter.string(from: date)
                        
                    }
                    
                    if let sunrise = sys["sunrise"] as? Double {
                        let date = Date(timeIntervalSince1970: sunrise)
                        self._sunrise = formatter.string(from: date)
                    }
                }
            }
            completed()
        }
    }
}
