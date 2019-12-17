//
//  DashboardViewController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol DashboardPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DashboardViewController: UIViewController, DashboardPresentable, DashboardViewControllable {

    weak var listener: DashboardPresentableListener?
    
    // MRAK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
}
