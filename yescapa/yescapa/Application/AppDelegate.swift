//
//  AppDelegate.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appDIContainer: AppDIContainer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        appDIContainer = AppDIContainer(navigationController: navigationController)
        appDIContainer?.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
