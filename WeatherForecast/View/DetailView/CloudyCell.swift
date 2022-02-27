//
//  CloudyCell.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

class CloudyCell: UITableViewCell {

    @IBOutlet weak var labelCloudy: UILabel!
    
    func configureCell(cloudy: Int) {
        labelCloudy.text = "\(cloudy)"
    }
}
