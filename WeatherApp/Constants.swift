//
//  Constants.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "2c3f8839952cfe1b30f4d8d720429759"

let CITIES_URL = "http://api.openweathermap.org/data/2.5/find?lat=-26.093611&lon=28.006390&cnt=50&appid=2c3f8839952cfe1b30f4d8d720429759"

typealias DownloadComplete = () -> ()
typealias StringToAnyObjectDictionary = Dictionary<String,AnyObject>

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(FORECAST_BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
