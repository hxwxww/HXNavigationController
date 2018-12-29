//
//  AppDelegate.swift
//  HXNavigationController
//
//  Created by HongXiangWen on 2018/12/14.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = .red
        navigationBar.tintColor = .white
        navigationBar.barStyle = .black
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ]
//        navigationBar.setBackgroundImage(UIImage(named: "sunset"), for: .default)
        
        return true
    }
    
}

