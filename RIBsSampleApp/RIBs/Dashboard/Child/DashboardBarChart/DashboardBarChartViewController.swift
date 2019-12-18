//
//  DashboardBarChartViewController.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol DashboardBarChartPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DashboardBarChartViewController: UIViewController, DashboardBarChartPresentable, DashboardBarChartViewControllable {

    weak var listener: DashboardBarChartPresentableListener?
    
    // MARK: Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
