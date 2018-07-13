//
//  HomeViewController.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/10/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import PinterestLayout

class HomeViewController: BaseViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    private var viewModel: HomeViewModel!
    private var feedType = FeedType.trending
    
    convenience init(feedType: FeedType) {
        self.init()
        self.feedType = feedType
    }
    
    override func setupView() {
        setupCollectionView()
    }
    
    override func setupViewModel() {
        viewModel = HomeViewModel(feedType: feedType)
    }
    
    override func setupRx() {
        viewModel.feeds
            .asObservable()
            .bind(to: collectionView.rx.items) { (collectionView, index, feed) -> UICollectionViewCell in
                let cell = collectionView.dequeue(ImageCollectionViewCell.self,
                                                  indexPath: IndexPath(row: index, section: 0))
                cell.bindingFeed(feed)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func setupCollectionView() {
        let layout = PinterestLayout()
        collectionView.collectionViewLayout = layout
        collectionView.register(ImageCollectionViewCell.self)
        
        layout.delegate = self
        layout.cellPadding = 5
        layout.numberOfColumns = 2
    }
}

extension HomeViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        let array: [CGFloat] = [80, 130, 200, 120, 130]
        let random = array.randomElement()
        return random
    }
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return 0
    }
}
