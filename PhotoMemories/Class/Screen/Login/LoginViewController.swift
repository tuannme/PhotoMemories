//
//  LoginViewController.swift
//  PhotoMemories
//
//  Created by Nguyen Manh Tuan on 7/8/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import RxSwift
import GoogleSignIn

class LoginViewController: BaseViewController {
    
    @IBOutlet weak private var googleButton: GIDSignInButton!
    
    override func setupView() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    private func gotoHome() {
        let tabbar = TabarViewController()
        navigationController?.pushViewController(tabbar, animated: true)
    }
}

extension LoginViewController: GIDSignInUIDelegate {
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        indicatorView.loading(true)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }
}

extension LoginViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        indicatorView.loading(false)
        guard let user = user else { return }
        GloablVariables.loginUser = user
        gotoHome()
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
