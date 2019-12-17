//
//  DashboardViewController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol DashboardPresentableListener: class {
    func tapFabButton()
}

final class DashboardViewController: BaseViewController, DashboardPresentable, DashboardViewControllable {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var fabButton: UIButton!
    
    // MARK: Properties
    
    weak var listener: DashboardPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupViews() {
        fabButton.rx.tap.asSignal()
            .emit(onNext: { [weak self] in self?.listener?.tapFabButton() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Router

extension DashboardViewController {
    
    func present(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
