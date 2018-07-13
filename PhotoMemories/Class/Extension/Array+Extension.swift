//
//  Array+Extension.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/13/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

extension Array {
    func randomElement() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
