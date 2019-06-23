//
//  GDriveService.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/17/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

import RxSwift

final class GDriveService {
    
    static let instance: GDriveService = {
        let gService = GDriveService()
        gService.setAuthentication()
        return gService
    }()
    
    private let service = GTLRDriveService()
    
    private func setAuthentication() {
        self.service.authorizer = GlobalVariables.loginUser.authentication.fetcherAuthorizer()
    }
    
    func fectch() -> Observable<[Feeds]> {
        return Observable.create { [unowned self] (observer) -> Disposable in
            let query = GTLRDriveQuery_FilesList.query()
            query.pageSize = 50
            query.corpora = "user"
            query.q = "mimeType='image/png' or mimeType='image/jpeg'"
            query.fields = "nextPageToken, files(id, name)"
            self.service.executeQuery(query) { (_, results, _) in
                if let results = results as? GTLRDrive_FileList, let files = results.files {
                    var feeds: [Feeds] = []
                    for file in files {
                        guard let identifier = file.identifier, let name = file.name else { return }
                        let feed = Feeds(identifier: identifier, name: name)
                        feeds.append(feed)
                    }
                    observer.onNext(feeds)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    func download(feed: Feeds) -> Observable<Data> {
        if let data = ImageCache.instance.getImage(name: feed.name) {
            return Observable.just(data)
        }
        
        return Observable.create { [unowned self] (observer) -> Disposable in
            let query = GTLRDriveQuery_FilesGet.queryForMedia(withFileId: feed.id)
            self.service.executeQuery(query) { (_, result, _) in
                if let file = result as? GTLRDataObject {
                    observer.onNext(file.data)
                    ImageCache.instance.saveImage(name: feed.name, data: file.data)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
}
