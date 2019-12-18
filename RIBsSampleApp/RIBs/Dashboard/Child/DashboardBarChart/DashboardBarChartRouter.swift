//
//  DashboardBarChartRouter.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardBarChartInteractable: Interactable {
    var router: DashboardBarChartRouting? { get set }
    var listener: DashboardBarChartListener? { get set }
}

protocol DashboardBarChartViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DashboardBarChartRouter: ViewableRouter<DashboardBarChartInteractable, DashboardBarChartViewControllable>, DashboardBarChartRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DashboardBarChartInteractable, viewController: DashboardBarChartViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
