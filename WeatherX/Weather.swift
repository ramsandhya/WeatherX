//
//  Weather.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/26/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    var date: Date!
    var cityName: String!
    var currentTemp: String!
    var displayTemp: String! {
        if let temp = currentTemp {
            return "\(temp) °F"
        } else {
            return "N/A"
        }
    }
    var iconImage: UIImage!
    var maxTemp: Int!
    var displayMaxTemp: String {
        if let temp = maxTemp {
            return "\(temp) °F"
        } else {
            return "N/A"
        }
    }
    var minTemp: Int!
    var displayMinTemp: String {
        if let temp = minTemp {
            return "\(temp) °F"
        } else {
            return "N/A"
        }
    }
    var iconName: String!
    var description: String!
    
}