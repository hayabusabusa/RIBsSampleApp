//
//  AnimationButton.swift
//  RIBsSampleApp
//
//  Created by 山田隼也 on 2019/12/17.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

class AnimationButton: UIButton {
    
    // MARK: IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOffset: CGSize = .zero
    @IBInspectable var shadowOpacity: Float = 0
    
    // MARK: Overrides
    
    override var isHighlighted: Bool {
        didSet {
            tappedAnimation(isHighlighted)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    private func commonInit() {
        isExclusiveTouch = true
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
    
    // MARK: Animatoin
    
    private func tappedAnimation(_ highlighted: Bool) {
        UIView.animate(withDuration: 0.15) {
            self.transform = highlighted
                ? CGAffineTransform(scaleX: 0.8, y: 0.8)
                : CGAffineTransform.identity
        }
    }
}
