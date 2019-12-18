//
//  TimerViewController.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol TimerPresentableListener: class {
    func tapCloseButton()
}

final class TimerViewController: BaseViewController, TimerPresentable, TimerViewControllable {

    weak var listener: TimerPresentableListener?
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
}

// MARK: - Setup

extension TimerViewController {
    
    private func setupNavigation() {
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        leftBarButtonItem.rx.tap.asSignal()
            .emit(onNext: { [weak self] in
                self?.listener?.tapCloseButton()
            })
            .disposed(by: disposeBag)
    }
}
