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
    func viewDidLoad()
    func tapFabButton()
}

final class DashboardViewController: BaseViewController, DashboardPresentable, DashboardViewControllable {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var containerOne: UIView!
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
        listener?.viewDidLoad()
    }
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupViews() {
        navigationItem.title = "Dashboard"
        fabButton.rx.tap.asSignal()
            .emit(onNext: { [weak self] in self?.listener?.tapFabButton() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Router

extension DashboardViewController {
    
    func addChild(viewControllable: ViewControllable) {
        // NOTE: StoryboardでVCを初期化してると、
        // RouterのdidLoadの方がStoryboardの描画よりも先に走ってしまうので
        // VCのOutlet接続された部品がnilになる.
        let targetView: UIView
        let vc = viewControllable.uiviewController
        
        switch vc {
        case is DashboardBarChartViewController:
            targetView = containerOne
        default:
            return
        }
        
        targetView.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
        
        // NOTE: ContainerView使うならこの辺が増えるからSnapKit使った方が早いかも...
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: targetView.topAnchor),
            vc.view.leadingAnchor.constraint(equalTo: targetView.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: targetView.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: targetView.bottomAnchor)
        ])
    }
    
    func present(viewControllable: ViewControllable) {
        let vc = BaseNavigationController(rootViewController: viewControllable.uiviewController)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func dismiss(viewControllable: ViewControllable) {
        // NOTE: NavigationControllerをpresentで噛ませていると、ここで困る
        // === で引数のviewControllableと比較してTrueを結果として得られない.
        dismiss(animated: true, completion: nil)
    }
}
