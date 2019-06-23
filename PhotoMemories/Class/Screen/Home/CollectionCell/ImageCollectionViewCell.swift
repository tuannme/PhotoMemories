//
//  ImageCollectionViewCell.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/13/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import PinterestLayout
import RxSwift

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak private var imageView: UIImageView!
    
    private let bag = DisposeBag()
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.imageHeight
        }
    }
    
    func bindingFeed(_ feed: Feeds) {
        imageView.loadFeedImage(feed, bag: bag)
    }
}
