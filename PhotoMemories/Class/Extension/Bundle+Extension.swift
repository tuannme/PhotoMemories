//
//  Bundle+Extension.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/10/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation

extension Bundle {
    func getGoogleClientKey() -> String? {
        guard let path = self.path(forResource: "GoogleService-Info", ofType: "plist") else { return nil }
        guard let rootDic = NSDictionary(contentsOfFile: path) else { return nil }
        return rootDic["CLIENT_ID"] as? String
    }
}
