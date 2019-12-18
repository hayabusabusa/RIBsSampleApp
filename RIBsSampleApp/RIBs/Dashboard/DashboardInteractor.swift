//
//  DashboardInteractor.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

protocol DashboardRouting: ViewableRouting {
    func routeToTimer()
    func backFromTimer()
}

protocol DashboardPresentable: Presentable {
    var listener: DashboardPresentableListener? { get set }
}

protocol DashboardListener: class {
    
}

final class DashboardInteractor: PresentableInteractor<DashboardPresentable>, DashboardInteractable, DashboardPresentableListener {

    weak var router: DashboardRouting?
    weak var listener: DashboardListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: DashboardPresentable) {
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

extension DashboardInteractor {
    
    func tapFabButton() {
        router?.routeToTimer()
    }
}

// MARK: - Child RIB Listener

extension DashboardInteractor {
    
    func didClose() {
        router?.backFromTimer()
    }
}
