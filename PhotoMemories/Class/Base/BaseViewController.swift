//
//  BaseViewController.swift
//  PhotoMemories
//
//  Created by Nguyen Manh Tuan on 7/8/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import RxSwift
import GoogleMobileAds

class BaseViewController: UIViewController {
    
    private var blurViewControler: UIViewController?
    private var _indicatorView: IndicatorCustomView?
    var indicatorView: IndicatorCustomView {
        if _indicatorView == nil {
            _indicatorView = IndicatorCustomView(frame: UIScreen.main.bounds)
        }
        return _indicatorView!
    }
    
    private var _navigationView: NavigationCustom?
    var navigationView: NavigationCustom {
        if _navigationView == nil {
            let frame = CGRect(x: 0,
                               y: 0,
                               width: UIScreen.main.bounds.width,
                               height: 44)
            _navigationView = NavigationCustom(frame: frame)
            view.addSubview(_navigationView!)
        }
        return _navigationView!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    internal let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        setupRx()
    }
    
    internal func setupView() {
        
    }
    
    internal func setupRx() {
        
    }
    
    internal func setupViewModel() {
        
    }
    
    internal func setBannerAd(_ bannerView: GADBannerView, bannerId: String) {
        bannerView.adUnitID = bannerId
        bannerView.rootViewController = self
        let request = GADRequest()
        //request.testDevices = [kGADSimulatorID]
        bannerView.load(request)
    }
    
    func addLoadingIndicator(_ indicator: ActivityIndicator) {
        indicator
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                self?.indicatorView.loading(isLoading)
            })
            .disposed(by: disposeBag)
    }
    
    func setNavigation(title: String, enableBack: Bool = true, enableMenu: Bool = false, shouldPopOnBack: Bool? = nil) {
        
        navigationView.config(title: title, enableBack: enableBack, enableMenu: enableMenu)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        let topView = NSLayoutConstraint(item: navigationView,
                                         attribute: .top,
                                         relatedBy: .greaterThanOrEqual,
                                         toItem: view, attribute: .top,
                                         multiplier: 1.0, constant: 20)
        topView.priority = UILayoutPriority(rawValue: 1000)
        topView.isActive = true
        
        let topLayout = NSLayoutConstraint(item: navigationView,
                                           attribute: .top,
                                           relatedBy: .equal,
                                           toItem: topLayoutGuide,
                                           attribute: .bottom,
                                           multiplier: 1.0,
                                           constant: 0)
        topLayout.priority = UILayoutPriority(rawValue: 750)
        topLayout.isActive = true
        
        NSLayoutConstraint(item: navigationView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: navigationView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        navigationView.backAction
            .subscribe(onNext: { [unowned self] _ in
                guard let navigation = self.navigationController else {
                    self.dismiss(animated: true, completion: nil)
                    return
                }
                navigation.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print(self.className + "didReceiveMemoryWarning")
    }
}
