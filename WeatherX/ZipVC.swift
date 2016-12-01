//
//  ZipVC.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/26/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class ZipVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var zipText: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBAction func submitInfo(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ToForecast", sender: nil)
    }
    
    let pickerData = ["USA", "India", "Canada", "France", "Germany", "Japan", "South Korea", "China"]
    
    var countryId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.dataSource = self
        countryPicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegates and datasources
    
    //MARK: Data SOurces
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryId = pickerData[row]
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newVC = segue.destination as! WeatherVC
                
     // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
