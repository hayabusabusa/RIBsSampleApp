//
//  RootRouter.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import RIBs

/// RootRIB Interactable
///
/// - Child RIB: Walkthrough RIB
protocol RootInteractable: Interactable, WalkthroughListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // VC
    func present(viewControllable: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    // MARK: Child RIBs
    
    private let walkthroughBuilder: WalkthroughBuildable
    private var walkthrough: ViewableRouting?
    
    // MARK: Initializer

    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  walkthroughBuilder: WalkthroughBuildable) {
        self.walkthroughBuilder = walkthroughBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: Lifecycle
    
    override func didLoad() {
        super.didLoad()
        attachChildRIBs()
    }
}

// MARK: Attach Child RIBs

extension RootRouter {
    
    private func attachChildRIBs() {
        // didLoadでattachしてViewをPresentするとRootVCのセットが終わる前にPresentするためエラーが出る. 
        // Unbalanced calls to begin/end appearance transitions( https://github.com/uber/RIBs/issues/165 )
        let walkthrough = walkthroughBuilder.build(withListener: interactor)
        self.walkthrough = walkthrough
        attachChild(walkthrough)
        
        viewController.present(viewControllable: walkthrough.viewControllable)
    }
}
