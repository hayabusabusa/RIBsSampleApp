//
//  WalkthroughViewController.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol WalkthroughPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class WalkthroughViewController: UIViewController, WalkthroughPresentable, WalkthroughViewControllable {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: Properties
    
    weak var listener: WalkthroughPresentableListener?
    
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    static func instantiate() -> WalkthroughViewController {
        let vc = Storyboard.WalkthroughViewController.instantiate(WalkthroughViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup

extension WalkthroughViewController {
    
    private func setupViews() {
        scrollView.rx.currentPage
            .bind(to: pageControl.rx.currentPage)
            .disposed(by: disposeBag)
    }
}
