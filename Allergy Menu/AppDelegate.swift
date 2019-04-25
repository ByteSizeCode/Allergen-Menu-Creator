//
//  AppDelegate.swift
//  Alergy Menu
//
//  Created by Isaac Raval on 4/21/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    static public let allergenMenuScreen = AllergenMenuVC()
    static public var menu: [Item] = []
    
    //Coordinates of previous label
    static public let labelX = 20
    static public var labeyYPrev = 50
    //Coordinates of previous allergen label
    static public var iconXPrev = 80
    static public var iconYPrev = 150
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

