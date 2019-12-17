//
//  TimerViewController.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TimerPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TimerViewController: UIViewController, TimerPresentable, TimerViewControllable {

    weak var listener: TimerPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        return vc
    }
}
