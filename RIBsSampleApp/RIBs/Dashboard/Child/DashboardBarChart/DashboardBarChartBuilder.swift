//
//  DashboardBarChartBuilder.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardBarChartDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class DashboardBarChartComponent: Component<DashboardBarChartDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DashboardBarChartBuildable: Buildable {
    func build(withListener listener: DashboardBarChartListener) -> DashboardBarChartRouting
}

final class DashboardBarChartBuilder: Builder<DashboardBarChartDependency>, DashboardBarChartBuildable {

    override init(dependency: DashboardBarChartDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DashboardBarChartListener) -> DashboardBarChartRouting {
        //let component = DashboardBarChartComponent(dependency: dependency)
        let viewController = DashboardBarChartViewController()
        let interactor = DashboardBarChartInteractor(presenter: viewController)
        interactor.listener = listener
        return DashboardBarChartRouter(interactor: interactor, viewController: viewController)
    }
}
