//
//  HomeHeaderView.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/11/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var imageLeadingConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        setupView()
    }
    
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    func scale(_ param: CGFloat) {
        imageView.transform = CGAffineTransform(scaleX: param, y: param)
        let space: CGFloat = 30.0
        imageLeadingConstraint.constant = space * param
        imageTopConstraint.constant = space * param
    }
}
