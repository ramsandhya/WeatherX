//
//  WeatherService.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/29/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    typealias onComplete = (_: [Weather]) -> Void
    static let serviceInstance = WeatherService()
    private init() {
    
    }
    func getWeatherArray (zipcode: String, countryId: String, completed: @escaping onComplete ) {
        
        let weatherURL = "http://api.openweathermap.org/data/2.5/forecast/daily?zip=\(zipcode),\(countryId)&cnt=10&appid=d572e3897b56c1638fada0388125c161"
        
        Alamofire
            .request(weatherURL)
            .responseJSON { response in
                
            if let JSON = response.result.value {
                print(JSON)
                var weatherArray: [Weather] = []
                // whole dictionary
                if let dictionary = JSON as? [String: Any] {
                    // accessing city which is a dictionary
                    guard let city = dictionary["city"] as? [String: Any],
                        let cityName = city["name"] as? String
                        else {
                            print("City not found")
                            return
                    }
                    
                    if let list = dictionary["list"] as? [[String: Any]] {
                        for item in list {
                            if let weather = Weather(cityName: cityName, json: item) {
                                weatherArray.append(weather)
                            }
                        }
                    }
                }
                print(weatherArray)
                completed(weatherArray)
            }
        }
    }
}

