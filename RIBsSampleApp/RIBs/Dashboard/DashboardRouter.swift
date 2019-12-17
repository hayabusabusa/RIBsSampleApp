//
//  DashboardRouter.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardInteractable: Interactable, TimerListener {
    var router: DashboardRouting? { get set }
    var listener: DashboardListener? { get set }
}

protocol DashboardViewControllable: ViewControllable {
    
}

final class DashboardRouter: ViewableRouter<DashboardInteractable, DashboardViewControllable>, DashboardRouting {

    // MARK: Child RIBs
    
    private let timerBuilder: TimerBuildable
    private var timer: ViewableRouting?
    
    init(interactor: DashboardInteractable,
                  viewController: DashboardViewControllable,
                  timerBuilder: TimerBuildable) {
        // Child RIBs
        self.timerBuilder = timerBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
