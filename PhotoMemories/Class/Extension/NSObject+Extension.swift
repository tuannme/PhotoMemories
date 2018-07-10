//
//  NSObject+Extension.swift
//  Vietnam News
//
//  Created by Nguyen Manh Tuan on 6/27/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
