//
//  Storyboard.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case RootViewController
    case WalkthroughViewController
    case LoginViewController
    case DashboardViewController
    case TimerViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateInitialViewController() as? VC else {
            fatalError("Storyboard \(self.rawValue) wasn`t found.")
        }
        return vc
    }
}
