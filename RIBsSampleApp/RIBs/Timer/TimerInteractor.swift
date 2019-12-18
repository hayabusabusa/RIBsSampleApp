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
    
}

protocol TimerPresentable: Presentable {
    var listener: TimerPresentableListener? { get set }
}

protocol TimerListener: class {
    func didClose()
}

final class TimerInteractor: PresentableInteractor<TimerPresentable>, TimerInteractable, TimerPresentableListener {

    weak var router: TimerRouting?
    weak var listener: TimerListener?

    override init(presenter: TimerPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - ViewController

extension TimerInteractor {
    
    func tapCloseButton() {
        listener?.didClose()
    }
}
