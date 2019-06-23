//
//  Feeds.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/13/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation

struct Feeds {
    var comment: String?
    var name: String
    var id: String
    
    init(identifier: String, name: String = "") {
        self.id = identifier
        self.name = name
    }
}
