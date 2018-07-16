//
//  HomeContainerViewController.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/11/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import MXSegmentedPager

class HomeContainerViewController: MXSegmentedPagerController {
    
    private let headerView = HomeHeaderView()
    private let headerTitles = ["Trending", "Following", "Saved"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedPager.backgroundColor = .white
        
        // Parallax Header
        segmentedPager.parallaxHeader.view = headerView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = 100
        segmentedPager.parallaxHeader.minimumHeight = UIDevice.current.screenType == .iPhoneX ? 44 : 20
        
        // Segmented Control customization
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        segmentedPager.segmentedControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let appleFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        
        let titleAttributes = [NSAttributedStringKey.font: appleFont ?? UIFont.systemFont(ofSize: 16),
                               kCTForegroundColorAttributeName: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)] as [AnyHashable: Any]
        segmentedPager.segmentedControl.titleTextAttributes = titleAttributes
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [kCTForegroundColorAttributeName: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        segmentedPager.segmentedControl.selectionStyle = .fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        segmentedPager.segmentedControl.selectionIndicatorHeight = 3
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return headerTitles[index]
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        if !parallaxHeader.progress.isNaN {
            headerView.scale(parallaxHeader.progress)
        }
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return 3
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        let vc = HomeViewController()
        vc.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return vc.view
    }
}
