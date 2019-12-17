//
//  UIViewController+Extension.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

extension UIViewController {

    func replaceRootViewController(by nextViewController: UIViewController) {
        guard let window = UIApplication.shared.keyWindow else { return }

        if window.rootViewController?.presentedViewController != nil {
            fatalError("\(type(of: self)) has presentedViewController")
        }

        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { () -> Void in
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = nextViewController
                UIView.setAnimationsEnabled(oldState)
            },
            completion: nil
        )
    }
}
