//
//  HomeViewController.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/10/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

private struct Constant {
    static let column: CGFloat = 3
    static let minLineSpacing: CGFloat = 15.0
    static let minItemSpacing: CGFloat = 15.0
    static let offset: CGFloat = 21.0
    
    static func getItemWidth() -> CGFloat {
        let boundWidth = UIScreen.main.bounds.width
        let totalWidth = boundWidth - (offset + offset) - ((column - 1) * minItemSpacing)
        return totalWidth / column
    }
}

class HomeViewController: BaseViewController {
    
    @IBOutlet weak private var collectionVIew: UICollectionView!
    
    override func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        collectionVIew.register(HomeMenuCell.self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(HomeMenuCell.self, indexPath: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Constant.offset, bottom: 0, right: Constant.offset)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = Constant.getItemWidth()
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
