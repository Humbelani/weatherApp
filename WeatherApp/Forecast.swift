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
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String {
//        if _date == nil {
//            _date = ""
//        }
//        return _date
        return _date ?? ""
    }
    
    var weatherType: String {
        return _weatherType ?? ""
    }
    
    var highTemp: String {
        return _highTemp ?? ""
    }
    
    var lowTemp: String {
        return _lowTemp ?? ""
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToCelcius = (min - 273.15)
                self._lowTemp = "\(kelvinToCelcius)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelcius = (max - 273.15)
                self._highTemp = "\(kelvinToCelcius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
}
