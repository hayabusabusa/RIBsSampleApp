//
//  SceneDelegate.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/15.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var launchRouter: LaunchRouting?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // - Setup Root RIB
        setupRootRIB(windowScene: windowScene)
    }
}

// MARK: - Setup Root RIB

extension SceneDelegate {
    
    private func setupRootRIB(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let launchRouter = RootBuilder(dependency: AppComponent()).build()
        self.window = window
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)
    }
}
