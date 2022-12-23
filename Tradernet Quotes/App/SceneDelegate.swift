//
//  SceneDelegate.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 22/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let quotesAssembly = QuotesAssembly()
        window?.rootViewController = UINavigationController(
            rootViewController: quotesAssembly.assembleViewController()
        )
        window?.makeKeyAndVisible()
    }

}

