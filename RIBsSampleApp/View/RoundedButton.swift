//
//  RoundedButton.swift
//  nissouken
//
//  Created by Yamada Shunya on 2019/12/06.
//  Copyright © 2019 Goldkey Co.,Ltd. All rights reserved.
//

import UIKit

//@IBDesignable
class RoundedButton: UIButton {

    // MARK: IBInspectable

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    // MARK: Properties

    // MARK: Overrides

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.4
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

        if let title = title(for: state) {
            setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key(String(kCTLanguageAttributeName)): "ja"]), for: .normal)
        }
    }

    // MARK: Initializer

    private func commonInit() {
        isExclusiveTouch = true
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
