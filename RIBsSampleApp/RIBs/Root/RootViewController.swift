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

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> RootViewController {
        let vc = Storyboard.RootViewController.instantiate(RootViewController.self)
        return vc
    }
}
