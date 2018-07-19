//
//  TabarViewController.swift
//  Vietnam News
//
//  Created by nguyen.manh.tuanb on 6/29/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import ALCameraViewController

class TabarViewController: ESTabBarController {
    
    let homeVC = HomeContainerViewController()
    let myphotoVC = MyPhotosViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
    }
    
    private func setupTabbarItem() {
        self.view.backgroundColor = .white
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        homeNavigation.isNavigationBarHidden = true
        homeNavigation.navigationBar.isTranslucent = false
        homeNavigation.tabBarItem = ESTabBarItem(TabbarItemContext(),
                                         title: nil,
                                         image: #imageLiteral(resourceName: "ic_feed"),
                                         selectedImage: #imageLiteral(resourceName: "ic_feed"))
        
        let cameraVC = UIViewController()
        cameraVC.tabBarItem = ESTabBarItem(TabbarItemHijackContext(),
                                            title: nil,
                                            image: #imageLiteral(resourceName: "ic_camera"),
                                            selectedImage: #imageLiteral(resourceName: "ic_camera"))
        
        myphotoVC.tabBarItem = ESTabBarItem(TabbarItemContext(),
                                          title: nil,
                                          image: #imageLiteral(resourceName: "ic_photos"),
                                          selectedImage: #imageLiteral(resourceName: "ic_photos"))
        
        viewControllers = [homeNavigation, cameraVC, myphotoVC]
        
        self.shouldHijackHandler = { ( _, _, index) in
            return index == 1
        }
        
        self.didHijackHandler = { [unowned self] ( _, _, index) in
            self.showCamera()
        }
    }
    
    private func showCamera() {
        let cameraViewController = CameraViewController { [weak self] image, _ in
            if let image = image {
                self?.didTakePhoto(image)
            }
            self?.dismiss(animated: true, completion: nil)
        }
        
        present(cameraViewController, animated: true, completion: nil)
    }
    
    private func didTakePhoto(_ photo: UIImage) {
        
    }
}
