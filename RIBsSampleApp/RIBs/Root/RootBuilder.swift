//
//  RootBuilder.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    
}

final class RootComponent: Component<RootDependency> {
    
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController.instantiate()
        let interactor = RootInteractor(presenter: viewController)
        
        // Child RIBs
        let walkthroughBuilder = WalkthroughBuilder(dependency: component)
        let loginBuilder = LoginBuilder(dependency: component)
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          walkthroughBuilder: walkthroughBuilder,
                          loginBuilder: loginBuilder)
    }
}
