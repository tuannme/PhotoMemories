//
//  UIImage+Extension.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/18/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import RxSwift

extension UIImageView {
    func loadFeedImage(_ feed: Feeds, bag: DisposeBag) {
        GDriveService.instance
            .download(feed: feed)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (data) in
                self?.image = UIImage(data: data)
            })
            .disposed(by: bag)
    }
}
