//
//  Double+Extension.swift
//  Vietnam News
//
//  Created by nguyen.manh.tuanb on 7/4/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation

extension Double {
    func stringValue() -> String {
        return String(format: "%.1f", self)
    }
    
    func fahrenheitToCelcius() -> Int {
        let celcius = (self - 32) * 0.556
        return Int(celcius)
    }
}
