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
        var feedsArray: [Feeds] = []
        for _ in 1...40 {
            let feed = Feeds(url: "https://i.imgur.com/m4lAhhr.jpg")
            feedsArray.append(feed)
        }
        feeds.accept(feedsArray)
    }
}
