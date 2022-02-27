//
//  UITextField.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
