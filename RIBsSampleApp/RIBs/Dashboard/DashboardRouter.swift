//
//  DashboardRouter.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardInteractable: Interactable, TimerListener, DashboardBarChartListener {
    var router: DashboardRouting? { get set }
    var listener: DashboardListener? { get set }
}

protocol DashboardViewControllable: ViewControllable {
    func addChild(viewControllable: ViewControllable)
    func present(viewControllable: ViewControllable)
    func dismiss(viewControllable: ViewControllable)
}

final class DashboardRouter: ViewableRouter<DashboardInteractable, DashboardViewControllable>, DashboardRouting {

    // MARK: Child RIBs
    
    private let dashboardBarChartBuilder: DashboardBarChartBuildable
    private var dashboardBarChart: ViewableRouting?
    
    private let timerBuilder: TimerBuildable
    private var timer: ViewableRouting?
    
    init(interactor: DashboardInteractable,
                  viewController: DashboardViewControllable,
                  dashboardBarChartBuilder: DashboardBarChartBuildable,
                  timerBuilder: TimerBuildable) {
        // Child RIBs
        self.dashboardBarChartBuilder = dashboardBarChartBuilder
        self.timerBuilder = timerBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension DashboardRouter {
    
    // MARK: Attach
    
    func attachBarChart() {
        let dashboardBarChart = dashboardBarChartBuilder.build(withListener: interactor)
        self.dashboardBarChart = dashboardBarChart
        attachChild(dashboardBarChart)
        viewController.addChild(viewControllable: dashboardBarChart.viewControllable)
    }
    
    // MARK: Route
    
    func routeToTimer() {
        let timer = timerBuilder.build(withListener: interactor)
        self.timer = timer
        attachChild(timer)
        viewController.present(viewControllable: timer.viewControllable)
    }
    
    func backFromTimer() {
        guard let timer = timer else { return }
        viewController.dismiss(viewControllable: timer.viewControllable)
        detachChild(timer)
        self.timer = nil
    }
}
