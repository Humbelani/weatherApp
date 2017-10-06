//
//  Location.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/03.
//  Copyright © 2017 Personal. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
