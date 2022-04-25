//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let habitsNavigationController = UINavigationController(rootViewController: HabitsViewController(color: UIColor(named: "allBackgroundColor")!))
        let infoNavigationController = UINavigationController(rootViewController: InfoViewController(color: .white, title: "Info"))
        
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Habits", image: UIImage(systemName: "rectangle.grid.1x2.fill"), selectedImage: nil)
        infoNavigationController.tabBarItem = UITabBarItem(title: "Info", image: UIImage(systemName: "info.circle.fill"), selectedImage: nil)
        
        window.rootViewController = TabBar(viewControllers: [habitsNavigationController, infoNavigationController])
        window.makeKeyAndVisible()
        self.window = window
    }
}

