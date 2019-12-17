//
//  LoginViewController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol LoginPresentableListener: class {
    func login(userName: String?, password: String?)
}

final class LoginViewController: BaseViewController, LoginPresentable, LoginViewControllable {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorMessageLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: Properties
    
    weak var listener: LoginPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> LoginViewController {
        let vc = Storyboard.LoginViewController.instantiate(LoginViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}


// MARK: - Setup

extension LoginViewController {
    
    private func setupViews() {
        // Label
        errorMessageLabel.alpha = 0
        errorMessageLabel.isHidden = true
        // Button
        PublishRelay
            .combineLatest(userNameTextField.rx.text.orEmpty,
                           passwordTextField.rx.text.orEmpty)
            .map { !$0.isEmpty && !$1.isEmpty }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        loginButton.rx.tap.asSignal()
            .emit(onNext: { [weak self] in
                self?.listener?.login(userName: self?.userNameTextField.text,
                                      password: self?.passwordTextField.text)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Interactor

extension LoginViewController {
    
    func updateErrorMessage(message: String?) {
        errorMessageLabel.text = message
        UIView.animate(withDuration: 0.3) {
            self.errorMessageLabel.isHidden = message == nil
            self.errorMessageLabel.alpha = message == nil ? 0 : 1
        }
    }
}
