//
//  DashboardBarChartInteractor.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

protocol DashboardBarChartRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol DashboardBarChartPresentable: Presentable {
    var listener: DashboardBarChartPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol DashboardBarChartListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class DashboardBarChartInteractor: PresentableInteractor<DashboardBarChartPresentable>, DashboardBarChartInteractable, DashboardBarChartPresentableListener {

    weak var router: DashboardBarChartRouting?
    weak var listener: DashboardBarChartListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: DashboardBarChartPresentable) {
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
