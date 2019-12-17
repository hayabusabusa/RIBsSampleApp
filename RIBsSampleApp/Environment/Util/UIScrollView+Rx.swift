//
//  UIScrollView+Rx.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {
    var currentPage: Observable<Int> {
        return didEndDecelerating.map {
            // スクロールが止まった時に走るデリゲートメソッドのRx
            // pageWidth: ScrollViewの幅(1ページの幅)
            // page: ( ( 止まったときのOffset.x座標 - 1ページの幅 / 2 ) / ページの幅 ) + 1
            
            let pageWidth = self.base.frame.width
            let page = floor((self.base.contentOffset.x - pageWidth / 2) / pageWidth) + 1
            
            // 確かに以下でいいのでは？
            // let page = self.base.contentOffset.x / pageWidth
            return Int(page)
        }
    }
}
