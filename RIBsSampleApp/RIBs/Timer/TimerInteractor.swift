//
//  TimerInteractor.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

protocol TimerRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TimerPresentable: Presentable {
    var listener: TimerPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TimerListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TimerInteractor: PresentableInteractor<TimerPresentable>, TimerInteractable, TimerPresentableListener {

    weak var router: TimerRouting?
    weak var listener: TimerListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TimerPresentable) {
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
