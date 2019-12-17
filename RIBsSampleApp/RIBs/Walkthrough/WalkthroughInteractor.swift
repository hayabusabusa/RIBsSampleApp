//
//  WalkthroughInteractor.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

protocol WalkthroughRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol WalkthroughPresentable: Presentable {
    var listener: WalkthroughPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol WalkthroughListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class WalkthroughInteractor: PresentableInteractor<WalkthroughPresentable>, WalkthroughInteractable, WalkthroughPresentableListener {

    weak var router: WalkthroughRouting?
    weak var listener: WalkthroughListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: WalkthroughPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
