//
//  API.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/17/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    case getFileList
}

extension API {
    
    var path: String {
        switch self {
        case .getFileList:
            return ""
        }
    }
    
    var medthod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}
