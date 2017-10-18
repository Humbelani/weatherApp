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
    var cityName = ""
    var weatherType = ""
    var currentTemp = 0.0
    var minTemp = 0.0
    var maxTemp = 0.0
    var humidity = 0.0
    var windSpeed = 0.0
    var cloudsCover = 0.0
    var sunset = ""
    var sunrise = ""
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        return "Today, \(currentDate)"
    }
    
    func downloadWeather(completed: @escaping DownloadComplete) {

        Alamofire.request(Constants.CurrentWeather.url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? StringToAnyObjectDictionary {
                if let name = dict["name"] as? String {
                    self.cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [StringToAnyObjectDictionary], let main = weather[0]["main"] as? String {
                        self.weatherType = main.capitalized
                }
                
                if let main = dict["main"] as? StringToAnyObjectDictionary {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToCelcius = (currentTemperature - 273.15)
                        self.currentTemp = kelvinToCelcius
                    }
                    
                    if let minTemp = main["temp_min"] as? Double {
                        let kelvinToCelcius = (minTemp - 273.15)
                        self.minTemp = kelvinToCelcius
                    }
                    
                    if let maxTemp = main["temp_max"] as? Double {
                        let kelvinToCelcius = (maxTemp - 273.15)
                        self.maxTemp = kelvinToCelcius
                    }
                    
                    if let humidity = main["humidity"] as? Double {
                        self.humidity = humidity
                    }
                }
                
                if let wind = dict["wind"] as? StringToAnyObjectDictionary, let speed = wind["speed"] as? Double {
                    self.windSpeed = speed
                }
                
                if let clouds = dict["clouds"] as? StringToAnyObjectDictionary, let all = clouds["all"] as? Double {
                        self.cloudsCover = all
                }
                
                if let sys = dict["sys"] as? StringToAnyObjectDictionary {
                    
                    let formatter = DateFormatter()
                    formatter.timeStyle = .short
                    formatter.dateStyle = .none
                    
                    if let sunset = sys["sunset"] as? Double {
                        let date = Date(timeIntervalSince1970: sunset)
                        self.sunset = formatter.string(from: date)
                    }
                    
                    if let sunrise = sys["sunrise"] as? Double {
                        let date = Date(timeIntervalSince1970: sunrise)
                        self.sunrise = formatter.string(from: date)
                    }
                }
            }
            completed()
        }
    }
}
