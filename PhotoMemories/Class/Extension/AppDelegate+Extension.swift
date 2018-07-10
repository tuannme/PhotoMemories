//
//  AppDelegate+Extension.swift
//  Vietnam News
//
//  Created by Nguyen Manh Tuan on 6/27/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setRootViewController(_ controller: UIViewController) {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.isNavigationBarHidden = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigation
    }
}
