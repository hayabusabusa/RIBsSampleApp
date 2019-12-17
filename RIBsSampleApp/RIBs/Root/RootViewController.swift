//
//  RootViewController.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // Interactor
}

final class RootViewController: BaseViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> RootViewController {
        let vc = Storyboard.RootViewController.instantiate(RootViewController.self)
        return vc
    }
}

extension RootViewController {
    
    func present(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func replaceRoot(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        replaceRoot(to: vc)
    }
}
