//
//  TimerRouter.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol TimerInteractable: Interactable {
    var router: TimerRouting? { get set }
    var listener: TimerListener? { get set }
}

protocol TimerViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TimerRouter: ViewableRouter<TimerInteractable, TimerViewControllable>, TimerRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TimerInteractable, viewController: TimerViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
