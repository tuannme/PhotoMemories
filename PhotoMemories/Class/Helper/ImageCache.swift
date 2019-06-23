//
//  ImageCache.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/18/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

class ImageCache: NSObject {
    
    private var imagePath: String!
    
    static let instance: ImageCache = {
        let cache = ImageCache()
        let fileManager = FileManager.default
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        cache.imagePath = (rootPath as NSString).appendingPathComponent("ImageFolder")
        
        do {
            if !fileManager.fileExists(atPath: cache.imagePath) {
                try fileManager.createDirectory(atPath: cache.imagePath,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } else {
                let folderSize = fileManager.folderSizeAtPath(cache.imagePath) / 1024 / 1024
                if folderSize > 400 {
                    cache.deleteImgCache()
                }
            }
        } catch {}
        
        return cache
    }()
    
    func deleteImgCache() {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: imagePath)
        } catch {}
    }
    
    func getImage(name: String) -> Data? {
        var data: Data?
        let fileManager = FileManager.default
        let urlPath = URL(fileURLWithPath: imagePath)
        let filePath = urlPath.appendingPathComponent(name.toPath())
        if fileManager.fileExists(atPath: filePath.path) {
            do {
                try data = Data(contentsOf: filePath)
                print("get file sucess :\(filePath.absoluteString)")
            } catch let error {
                print("get file error :\(error.localizedDescription)")
            }
        }
        return data
    }
    
    func saveImage(name: String, data: Data) {
        let urlPath = URL(fileURLWithPath: imagePath)
        let newPath = urlPath.appendingPathComponent(name.toPath())
        do {
            try data.write(to: newPath, options: .atomic)
            print("save file sucess :\(newPath.absoluteString)")
        } catch let error {
            print("save file error :\(error.localizedDescription)")
        }
    }
}

extension FileManager {
    
    func fileSizeAtPath(_ path: String) -> Int64 {
        var fileSize: Int64 = 0
        do {
            let fileAttributes = try attributesOfItem(atPath: path)
            let fileSizeNumber = fileAttributes[FileAttributeKey.size]
            fileSize = (fileSizeNumber as AnyObject).int64Value!
        } catch { }
        return fileSize
    }
    
    func folderSizeAtPath(_ path: String) -> Int64 {
        var size: Int64 = 0
        do {
            let files = try subpathsOfDirectory(atPath: path)
            for i in 0 ..< files.count {
                size += fileSizeAtPath((path as NSString).appendingPathComponent(files[i]) as String)
            }
        } catch { }
        return size
    }
}
