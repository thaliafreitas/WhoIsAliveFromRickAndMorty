//
//  SceneDelegate.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 24/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            let tabBar = UITabBarController()
            let homeViewController = HomeViewController()
            let favoriteViewController = FavoriteViewController()
            let homeNavigationViewController = UINavigationController(rootViewController: homeViewController)
            let favoriteNavigationViewController = UINavigationController(rootViewController: favoriteViewController)
            tabBar.viewControllers = [homeNavigationViewController, favoriteViewController]
            homeNavigationViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
            window.rootViewController = tabBar
            window.makeKeyAndVisible()
                }
        window?.windowScene = windowScene
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataManager.sharedInstance.saveContext()
    }

}

