//
//  DashboardBuilder.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class DashboardComponent: Component<DashboardDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DashboardBuildable: Buildable {
    func build(withListener listener: DashboardListener) -> DashboardRouting
}

final class DashboardBuilder: Builder<DashboardDependency>, DashboardBuildable {

    override init(dependency: DashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DashboardListener) -> DashboardRouting {
        //let component = DashboardComponent(dependency: dependency)
        let viewController = DashboardViewController.instantiate()
        let interactor = DashboardInteractor(presenter: viewController)
        interactor.listener = listener
        return DashboardRouter(interactor: interactor, viewController: viewController)
    }
}
