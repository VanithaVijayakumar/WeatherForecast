//
//  ClearCell.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

class ClearCell: UITableViewCell {

    @IBOutlet weak var labelClear: UILabel!
    
    func configureCell(clear: String) {
        labelClear.text = clear
    }
}
