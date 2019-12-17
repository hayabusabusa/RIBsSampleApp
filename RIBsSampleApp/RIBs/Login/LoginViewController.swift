//
//  LoginViewController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoginPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoginViewController: BaseViewController, LoginPresentable, LoginViewControllable {

    weak var listener: LoginPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> LoginViewController {
        let vc = Storyboard.LoginViewController.instantiate(LoginViewController.self)
        return vc
    }
}
