//
//  WalkthroughRouter.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

protocol WalkthroughInteractable: Interactable {
    var router: WalkthroughRouting? { get set }
    var listener: WalkthroughListener? { get set }
}

protocol WalkthroughViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WalkthroughRouter: ViewableRouter<WalkthroughInteractable, WalkthroughViewControllable>, WalkthroughRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WalkthroughInteractable, viewController: WalkthroughViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
