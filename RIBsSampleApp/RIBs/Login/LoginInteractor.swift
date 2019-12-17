//
//  LoginInteractor.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift

protocol LoginRouting: ViewableRouting {
    // Router
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
    
    func updateErrorMessage(message: String?)
}

protocol LoginListener: class {
    func didLogin()
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
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

// MARK: - Listener

extension LoginInteractor {
    
    func login(userName: String?, password: String?) {
        guard let userName = userName,
            let password = password else { return }
        
        if userName == Configurations.kCommonUserName,
            password == Configurations.kCommonUserPassword {
            LocalSettings.saveLoginStatus(.loggedIn)
            presenter.updateErrorMessage(message: nil)
            listener?.didLogin()
        } else {
            presenter.updateErrorMessage(message: "ユーザー名もしくはパスワードが一致しません。")
        }
    }
}
