//
//  Date+Extensions.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
}
