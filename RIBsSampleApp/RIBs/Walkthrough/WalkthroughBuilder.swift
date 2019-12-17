//
//  WalkthroughBuilder.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol WalkthroughDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WalkthroughComponent: Component<WalkthroughDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WalkthroughBuildable: Buildable {
    func build(withListener listener: WalkthroughListener) -> WalkthroughRouting
}

final class WalkthroughBuilder: Builder<WalkthroughDependency>, WalkthroughBuildable {

    override init(dependency: WalkthroughDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WalkthroughListener) -> WalkthroughRouting {
        //let component = WalkthroughComponent(dependency: dependency)
        let viewController = WalkthroughViewController.instantiate()
        let interactor = WalkthroughInteractor(presenter: viewController)
        interactor.listener = listener
        return WalkthroughRouter(interactor: interactor, viewController: viewController)
    }
}
