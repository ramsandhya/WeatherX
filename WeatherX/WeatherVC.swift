//
//  ViewController.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/26/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit
import Foundation

class WeatherVC: UIViewController {

    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var displayCity: UILabel!
    @IBOutlet weak var displayIcon: UIImageView!
    @IBOutlet weak var displayTemp: UILabel!
    @IBOutlet weak var iconName: UILabel!
    
    var weatherArray: 
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeather()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayWeather() {
        
        displayCity.text = "Johns Creek"
        currentDate.text = "11/28/16"
        displayIcon.image = UIImage(named: "01d")
        displayTemp.text = "72 °F"
        iconName.text = "Cloudy"
    }

}

