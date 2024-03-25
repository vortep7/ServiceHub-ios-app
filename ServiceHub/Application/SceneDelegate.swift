//
//  SceneDelegate.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        //MARK: - create NavController 
        let rootController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: rootController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

