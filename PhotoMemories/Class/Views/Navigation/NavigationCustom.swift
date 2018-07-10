//
//  NavigationCustom.swift
//  Oz Tax Return
//
//  Created by Nguyen Manh Tuan on 4/10/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class NavigationCustom: UIView {
    
    @IBOutlet weak private var navigationTitleLabel: UILabel!
    @IBOutlet weak private var leftImageView: UIImageView!
    @IBOutlet weak private var rightImageView: UIImageView!
    @IBOutlet weak private var leftButton: UIButton!
    @IBOutlet weak private var rightButton: UIButton!
    
    var backAction: Observable<Void>!
    var menuAction: Observable<Void>!
    private let disposeBag = DisposeBag()
    
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
        setupRx()
    }
    
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    private func setupRx() {
        backAction = leftButton.rx
            .tap
            .asObservable()
            .flatMapLatest { _ -> Observable<Void> in
                return Observable.just(())
            }
        
        menuAction = rightButton.rx
            .tap.asObservable()
            .flatMapLatest { _ -> Observable<Void> in
                return Observable.just(())
            }
    }
}

extension NavigationCustom {

    func config(title: String, enableBack: Bool = true, enableMenu: Bool = false) {
        navigationTitleLabel.text = title
        leftImageView.isHidden = !enableBack
        leftButton.isHidden = !enableBack
        rightButton.isHidden = !enableMenu
        rightImageView.isHidden = !enableMenu
    }
}
