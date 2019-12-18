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
    func attachBarChart()
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

    override init(presenter: DashboardPresentable) {
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

extension DashboardInteractor {
    
    func viewDidLoad() {
        router?.attachBarChart()
    }
    
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
