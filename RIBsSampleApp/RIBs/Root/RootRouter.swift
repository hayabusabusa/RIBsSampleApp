//
//  RootRouter.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

/// RootRIB Interactable
///
/// - Child RIB: Walkthrough RIB
/// - Child RIB: Login RIB
protocol RootInteractable: Interactable, WalkthroughListener, LoginListener, DashboardListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

// Something to do on ViewController.
protocol RootViewControllable: ViewControllable {
    func replaceRoot(viewControllable: ViewControllable)
    func replaceRootWithNavigation(viewControllable: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    // MARK: Child RIBs
    
    private let walkthroughBuilder: WalkthroughBuildable
    private var walkthrough: ViewableRouting?
    
    private let loginBuilder: LoginBuildable
    private var login: ViewableRouting?
    
    private let dashboardBuilder: DashboardBuildable
    private var dashboard: ViewableRouting?
    
    // MARK: Initializer

    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  walkthroughBuilder: WalkthroughBuildable,
                  loginBuilder: LoginBuildable,
                  dashboardBuilder: DashboardBuildable) {
        // Child RIBs
        self.walkthroughBuilder = walkthroughBuilder
        self.loginBuilder = loginBuilder
        self.dashboardBuilder = dashboardBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: Lifecycle
    
    override func didLoad() {
        super.didLoad()
        attachChildRIBs()
    }
}

// MARK: Attach Child RIBs

extension RootRouter {
    
    private func attachChildRIBs() {
        // didLoadでattachしてViewをPresentするとRootVCのセットが終わる前にPresentするためエラーが出る. 
        // Unbalanced calls to begin/end appearance transitions( https://github.com/uber/RIBs/issues/165 )
        if LocalSettings.getWalkThroughStatus() {
            
            switch LocalSettings.getLoginStatus() {
            case .loggedOut:
                let login = loginBuilder.build(withListener: interactor)
                self.login = login
                attachChild(login)
                
                viewController.replaceRoot(viewControllable: login.viewControllable)
            case .loggedIn:
                let dashboard = dashboardBuilder.build(withListener: interactor)
                self.dashboard = dashboard
                attachChild(dashboard)
                
                viewController.replaceRootWithNavigation(viewControllable: dashboard.viewControllable)
            }
            
        } else {
            let walkthrough = walkthroughBuilder.build(withListener: interactor)
            self.walkthrough = walkthrough
            attachChild(walkthrough)
            
            viewController.replaceRoot(viewControllable: walkthrough.viewControllable)
        }
        
    }
}

// MARK: - Child RIBs routing

extension RootRouter {
    
    func routeToLogin() {
        guard let walkthrough = walkthrough else { return }
        let login = loginBuilder.build(withListener: interactor)
        
        // Detach
        detachChild(walkthrough)
        self.walkthrough = nil
        
        // Attach
        self.login = login
        attachChild(login)
        viewController.replaceRoot(viewControllable: login.viewControllable)
    }
    
    func routeToDashboard() {
        guard let login = login else { return }
        let dashboard = dashboardBuilder.build(withListener: interactor)
        
        // Detach
        detachChild(login)
        self.login = nil
        
        // Attach
        self.dashboard = dashboard
        attachChild(dashboard)
        viewController.replaceRootWithNavigation(viewControllable: dashboard.viewControllable)
    }
}
