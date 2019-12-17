//
//  WalkthroughInteractor.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

// Router
protocol WalkthroughRouting: ViewableRouting {
    
}

// ViewController
protocol WalkthroughPresentable: Presentable {
    var listener: WalkthroughPresentableListener? { get set }
}

// Other RIBs
protocol WalkthroughListener: class {
    func didEndWalkthrough()
}

final class WalkthroughInteractor: PresentableInteractor<WalkthroughPresentable>, WalkthroughInteractable, WalkthroughPresentableListener {

    weak var router: WalkthroughRouting?
    weak var listener: WalkthroughListener?

    override init(presenter: WalkthroughPresentable) {
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

extension WalkthroughInteractor {
    
    func endWalkthrough() {
        // Save walkthrough status
        LocalSettings.saveWalkThroughStatus(true)
        listener?.didEndWalkthrough()
    }
}
