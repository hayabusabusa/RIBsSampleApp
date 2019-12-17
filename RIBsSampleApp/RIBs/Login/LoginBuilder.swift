//
//  LoginBuilder.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol LoginDependency: Dependency {
    
}

final class LoginComponent: Component<LoginDependency> {
    
}

// MARK: - Builder

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginListener) -> LoginRouting {
        //let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController.instantiate()
        let interactor = LoginInteractor(presenter: viewController)
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
