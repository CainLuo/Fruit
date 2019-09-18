//
//  SceneDelegate.swift
//  Fruit
//
//  Created by Cain Luo on 2019/9/18.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
          let splitViewController = window?.rootViewController as? UISplitViewController,
          let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
          let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
          let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
          else { fatalError() }

        let firstMonster = masterViewController.fruits.first
        detailViewController.furti = firstMonster
        masterViewController.delegate = detailViewController
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    }
}

