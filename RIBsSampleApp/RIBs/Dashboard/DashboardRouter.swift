//
//  DashboardRouter.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol DashboardInteractable: Interactable {
    var router: DashboardRouting? { get set }
    var listener: DashboardListener? { get set }
}

protocol DashboardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DashboardRouter: ViewableRouter<DashboardInteractable, DashboardViewControllable>, DashboardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DashboardInteractable, viewController: DashboardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
