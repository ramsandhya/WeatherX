//
//  Weather.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/26/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

struct Weather {
    var date: Date!
    var cityName: String!
    var currentTemp: Int!
    var displayTemp: String! {
        if let temp = currentTemp {
            return "\(temp) °F"
        } else {
            return "N/A"
        }
    }
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
    var iconImage: UIImage! {
        if let icon = iconName {
            return UIImage(named: icon)
        } else {
            return nil
        }
    }
    var mainDesc: String!
    var description: String = ""
    
    
    init?(cityName: String, json: [String: Any] ) {
        
        guard
        // Accessing the "list" being a dictionary of many items. Each "item" is dictionary too.
        // accessing "dt" in the list
        let date = json["dt"] as? Double,
        
        // Accessing "temp" in the list
        let temp = json["temp"] as? [String: Any],
        // accessing different keys inside "temp"
        let currTemp = temp["day"] as? Double,
        let maxiTemp = temp["max"] as? Double,
        let miniTemp = temp["min"] as? Double,
        
        // accessing "weather" in the list
        let weather = json["weather"] as? [[String: Any]],
        // accessing diff. keys in the "weather"
        let main = weather[0]["main"] as? String,
        let desc = weather[0]["description"] as? String,
        let icon = weather[0]["icon"] as? String
        
        else {
            return nil
        }
        
        self.date = Date.init(timeIntervalSince1970: date)
        self.cityName = cityName
        self.currentTemp = Int(9/5 * (currTemp - 273) + 32)
        self.maxTemp = Int(9/5 * (maxiTemp - 273) + 32)
        self.minTemp = Int(9/5 * (miniTemp - 273) + 32)
        self.iconName = icon
        self.mainDesc = main
        self.description = desc
        
        
    }
}
