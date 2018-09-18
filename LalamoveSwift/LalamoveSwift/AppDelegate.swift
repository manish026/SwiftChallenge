//
//  AppDelegate.swift
//  LalamoveSwift
//
//  Created by Manish on 14/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Variables
    
    var window: UIWindow?
    
    /// returns root view controller
    private var rootViewController: UIViewController {
        let controller = Controllers.deliveryList.rawValue
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }

    
    //MARK: Functions
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setWindow()
        
        return true
    }

    
    /// Intializes window and adds a root view controller
    func setWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = rootViewController
        
        window!.makeKeyAndVisible()
        
    }
    

}

