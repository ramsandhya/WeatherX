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
    
    var weatherArray: [Weather]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleWeather()
        tableView.delegate = self
        tableView.dataSource = self
        displayWeather()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayWeather() {
        
        if weatherArray != nil && weatherArray.count > 0 {
            let weather = weatherArray[0]
            displayCity.text = "Johns Creek"
            currentDate.text = "11/28/16"
            displayIcon.image = weather.iconImage
            displayTemp.text = weather.displayMaxTemp
            iconName.text = weather.description
        }
    }
    
    func loadSampleWeather() {
        
        weatherArray = [Weather]()
        let image1 = UIImage(named: "Clear")!
        let first = Weather(image: image1, desc: "Sunny", min: 50, max: 60)
        let image2 = UIImage(named: "Partially Cloudy")!
        let second = Weather(image: image2, desc: "Cloudy", min: 55, max: 65)
        let image3 = UIImage(named: "Thunderstorm")!
        let third = Weather(image: image3, desc: "Rainy", min: 70, max: 75)
        let image4 = UIImage(named: "Snow")!
        let fourth = Weather(image: image4, desc: "Snow", min: 53, max: 55)
        let image31 = UIImage(named: "Clear")!
        let third1 = Weather(image: image31, desc: "Sunny", min: 70, max: 75)
        let image41 = UIImage(named: "Snow")!
        let fourth1 = Weather(image: image41, desc: "Snow", min: 53, max: 55)
        
        weatherArray.append(contentsOf: [first, second, third, fourth, third1, fourth1])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count - 1
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

