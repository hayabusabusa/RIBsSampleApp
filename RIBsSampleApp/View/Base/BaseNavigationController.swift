//
//  BaseNavigationController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    // MARK: Overrides
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        super.pushViewController(viewController, animated: animated)
    }
}

extension BaseNavigationController {
    
    private func setupAppearance() {
        view.backgroundColor = .systemBackground
        navigationBar.tintColor = .systemBlue
        navigationBar.barTintColor = .systemBackground
        //navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                             .foregroundColor: UIColor.systemBlue]
    }
}
