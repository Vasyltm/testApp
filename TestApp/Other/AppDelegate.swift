//
//  AppDelegate.swift
//  TestApp
//
//  Created by Vasyl Travlinskyy on 01.07.2020.
//  Copyright © 2020 Vasyl Travlinskyy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    let tabBar = CustomTabBarController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setRootViewController()

        
        return true
    }

   func setRootViewController() {
        let home = Home()
        let homeNavigationController = UINavigationController(rootViewController: home)
        homeNavigationController.navigationBar.barStyle = .black
        home.title = "Home"
        home.tabBarItem.image = UIImage(named: "home")
        
        let chat = Chat()
        chat.title = "Chat"
        chat.tabBarItem.image = UIImage(named: "chat")
        
        let account = Account()
        account.title = "Account"
        account.tabBarItem.image = UIImage(named: "account")
        
        tabBar.setViewControllers([homeNavigationController, chat, account], animated: true)
        
        window?.backgroundColor = UICommon.colorBackground
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

