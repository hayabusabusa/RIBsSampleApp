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
    
    // TODO: Impl splash animation
}

extension RootViewController {
    
    func replaceRoot(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        replaceRoot(to: vc)
    }
    
    func replaceRootWithNavigation(viewControllable: ViewControllable) {
        // NOTE: とりあえずRIBにはせず、VCで遷移のときに入れてみる
        let vc = UINavigationController(rootViewController: viewControllable.uiviewController)
        replaceRoot(to: vc)
    }
}
