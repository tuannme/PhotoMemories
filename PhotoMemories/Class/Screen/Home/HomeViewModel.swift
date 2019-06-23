//
//  HomeViewModel.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/13/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class HomeViewModel: BaseViewModel {
    
    let feeds = BehaviorRelay<[Feeds]>(value: [])
 
    init(feedType: FeedType) {
        super.init()
        loadFeeds(feedType: feedType)
    }
    
    private func loadFeeds(feedType: FeedType) {
        GDriveService.instance.fectch().bind(to: feeds).disposed(by: disposeBag)
    }
}
