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
        
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.layer.cornerRadius = 15
    }

    func scale(_ param: CGFloat) {
        let scale = min(param, 2)
        imageLeadingConstraint.constant = 20 * scale
        imageTopConstraint.constant = UIDevice.current.screenType == .iPhoneX ? 40 * scale : 20 * scale
        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
