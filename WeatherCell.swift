//
//  WeatherCell.swift
//  WeatherX
//
//  Created by Jitendra Ram on 11/28/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellDay: UILabel!
    @IBOutlet weak var cellDesc: UILabel!    
    @IBOutlet weak var cellMin: UILabel!
    @IBOutlet weak var cellMax: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
