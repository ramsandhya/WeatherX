//
//  ViewController.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/26/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit
import Foundation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var displayCity: UILabel!
    @IBOutlet weak var displayIcon: UIImageView!
    @IBOutlet weak var displayTemp: UILabel!
    @IBOutlet weak var iconName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var zipcode: String! = "30097"
    var countryId: String! = "us"
    
    var weatherArray: [Weather]! {
        didSet{
            displayWeather()
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        //loadSampleWeather()
        displayWeather()
        
        WeatherService.serviceInstance.getWeatherArray(zipcode: zipcode, countryId: countryId, completed: {(weatherArray: [Weather]) in
            self.weatherArray = weatherArray
            
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayWeather() {
        
        if weatherArray != nil && weatherArray.count > 0 {
            let weather = weatherArray[0]
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US")
            formatter.setLocalizedDateFormatFromTemplate("MM/dd/yyyy")
            currentDate.text = formatter.string( from: weather.date)
            displayCity.text = weather.cityName
            
            displayIcon.image = weather.iconImage
            displayTemp.text = weather.displayMaxTemp
            iconName.text = weather.description
        }
    }
    
    func loadSampleWeather() {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        if weatherArray != nil && indexPath.row < weatherArray.count - 1 {
        let weather = weatherArray[indexPath.row + 1]
        
        cell.cellImage.image = weather.iconImage
        cell.cellDesc.text = weather.description
        cell.cellMin.text = weather.displayMinTemp
        cell.cellMax.text = weather.displayMaxTemp
        }
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.cyan
        } else {
            cell.backgroundColor = UIColor.clear
        }
        return cell
    }

}

