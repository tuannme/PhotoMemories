//
//  HomeViewController.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/10/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import ParallaxHeader

class HomeViewController: BaseViewController {

    @IBOutlet weak private var tbView: UITableView!
    
    override func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tbView.register(HomeTableViewCell.self)
        tbView.estimatedRowHeight = 60
        tbView.rowHeight = UITableViewAutomaticDimension
        tbView.delegate = self
        tbView.dataSource = self
        setupParallaxHeader()
    }
    
    private func setupParallaxHeader() {
        let headerView = HomeHeaderView()
        headerView.contentMode = .scaleToFill
        headerView.blurView.setup(style: UIBlurEffectStyle.dark, alpha: 1).enable()
        
        tbView.parallaxHeader.view = headerView
        tbView.parallaxHeader.height = 100
        tbView.parallaxHeader.minimumHeight = 0
        tbView.parallaxHeader.mode = .centerFill
        tbView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
            let scale = parallaxHeader.progress > 2 ? 2 : parallaxHeader.progress
            headerView.scale(scale)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeue(HomeTableViewCell.self)
        return cell
    }
}
