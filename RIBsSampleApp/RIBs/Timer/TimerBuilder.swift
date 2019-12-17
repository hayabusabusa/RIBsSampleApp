//
//  TimerBuilder.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol TimerDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TimerComponent: Component<TimerDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TimerBuildable: Buildable {
    func build(withListener listener: TimerListener) -> TimerRouting
}

final class TimerBuilder: Builder<TimerDependency>, TimerBuildable {

    override init(dependency: TimerDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TimerListener) -> TimerRouting {
        //let component = TimerComponent(dependency: dependency)
        let viewController = TimerViewController.instantiate()
        let interactor = TimerInteractor(presenter: viewController)
        interactor.listener = listener
        return TimerRouter(interactor: interactor, viewController: viewController)
    }
}
