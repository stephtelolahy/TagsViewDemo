//
//  TagView.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

@IBDesignable
open class TagView: UIButton {
    
    // MARK: - Properties
    
    open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    open var borderColor: UIColor = .lightGray {
        didSet {
            reloadStyles()
        }
    }
    
    open var tagBackgroundColor: UIColor = .clear {
        didSet {
            reloadStyles()
        }
    }
    
    open var textColor: UIColor = .black {
        didSet {
            reloadStyles()
        }
    }
    
    open var textFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            titleLabel?.font = textFont
        }
    }
    
    open var titleLineBreakMode: NSLineBreakMode = .byTruncatingMiddle {
        didSet {
            titleLabel?.lineBreakMode = titleLineBreakMode
        }
    }
    
    open var paddingY: CGFloat  = 0 {
        didSet {
            titleEdgeInsets.top = paddingY
            titleEdgeInsets.bottom = paddingY
        }
    }
    
    open var paddingX: CGFloat = 0 {
        didSet {
            titleEdgeInsets.left = paddingX
            titleEdgeInsets.right = paddingX
        }
    }
    
    private func reloadStyles() {
        backgroundColor = tagBackgroundColor
        layer.borderColor = borderColor.cgColor
        setTitleColor(textColor, for: UIControl.State())
    }
    
    // MARK: - init
    
    public init(title: String) {
        super.init(frame: CGRect.zero)
        setTitle(title, for: UIControl.State())
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        titleLabel?.lineBreakMode = titleLineBreakMode
        frame.size = intrinsicContentSize
    }
    
    // MARK: - Interface builder
    
    override open var intrinsicContentSize: CGSize {
        var size = titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font: textFont]) ?? CGSize.zero
        size.height = textFont.pointSize + paddingY * 2
        size.width += paddingX * 2
        if size.width < size.height {
            size.width = size.height
        }
        return size
    }
}
