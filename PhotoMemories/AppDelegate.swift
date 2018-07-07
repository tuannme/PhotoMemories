//
//  AppDelegate.swift
//  PhotoMemories
//
//  Created by Nguyen Manh Tuan on 7/7/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let loginVC = LoginViewController()
        setRootViewController(loginVC)

        return true
    }

    func setRootViewController(_ controller: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = controller
    }
}

