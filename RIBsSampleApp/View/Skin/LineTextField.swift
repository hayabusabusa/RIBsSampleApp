//
//  LineTextField.swift
//  nissouken
//
//  Created by Yamada Shunya on 2019/12/10.
//  Copyright © 2019 Goldkey Co.,Ltd. All rights reserved.
//

import UIKit

class LineTextField: UITextField {

    // MARK: IBInspectable

    @IBInspectable var iconImage: UIImage?
    @IBInspectable var lineColor: UIColor = .lightGray
    @IBInspectable var placeholderColor: UIColor = .lightGray

    // MARK: Properties

    private let lineView = UIView()

    // MARK: Overrides

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

   // テキストの内側の余白
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += 4
        //textRect.origin.y = self.bounds.height / 2
        return textRect
    }

    // 入力中のテキストの内側の余白
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var editingRect = super.editingRect(forBounds: bounds)
        editingRect.origin.x += 4
        //editingRect.origin.y = self.bounds.height / 2
        return editingRect
    }
    
    // MARK: Initializer

    private func commonInit() {
        isExclusiveTouch = true
        borderStyle = .none
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        setupViews()
    }

    // MARK: Private method

    private func setupViews() {
        // - LineView
        lineView.backgroundColor = lineColor
        lineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        // - Icon Image
        if let iconImage = iconImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
            imageView.image = iconImage
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = lineColor
            leftView = imageView
            leftViewMode = .always
        }
    }
}
