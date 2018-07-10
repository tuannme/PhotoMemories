//
//  String+Extension.swift
//  Vietnam News
//
//  Created by Nguyen Manh Tuan on 6/30/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

extension String {
    
    func toDate(formart: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"//this your string date format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: self)
        return date ?? Date()
    }
    
    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func getImageFromSrcTag() -> String? {
        guard let src = self.matches(for: "src.*jpg").last else { return nil }
        guard let link = src.matches(for: "http.*jpg").last else { return nil }
        let components = link.components(separatedBy: " ")
        for component in components {
            if let imageURL = component.matches(for: "http.*jpg").last {
                return imageURL
            }
        }
        return nil
    }
    
    func getYoutubeImage() -> String {
        let url = "http://img.youtube.com/vi/\(self)/hqdefault.jpg"
        return url
    }
}
