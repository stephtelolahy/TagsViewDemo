//
//  TagView.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

@IBDesignable
class TagView: UIButton {
    
    // MARK: - Properties
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var borderColor: UIColor = .lightGray {
        didSet {
            reloadStyles()
        }
    }
    
    var tagBackgroundColor: UIColor = .clear {
        didSet {
            reloadStyles()
        }
    }
    
    var textColor: UIColor = .black {
        didSet {
            reloadStyles()
        }
    }
    
    var textFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            titleLabel?.font = textFont
        }
    }
    
    var titleLineBreakMode: NSLineBreakMode = .byTruncatingMiddle {
        didSet {
            titleLabel?.lineBreakMode = titleLineBreakMode
        }
    }
    
    var paddingY: CGFloat  = 0 {
        didSet {
            titleEdgeInsets.top = paddingY
            titleEdgeInsets.bottom = paddingY
        }
    }
    
    var paddingX: CGFloat = 0 {
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
    
    init(tag: Tag) {
        super.init(frame: CGRect.zero)
        setTitle(tag.title, for: UIControl.State())
        isSelected = tag.selected
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        titleLabel?.lineBreakMode = titleLineBreakMode
        frame.size = intrinsicContentSize
    }
    
    // MARK: - Interface builder
    
    override var intrinsicContentSize: CGSize {
        var size = titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font: textFont]) ?? CGSize.zero
        size.height = textFont.pointSize + paddingY * 2
        size.width += paddingX * 2
        if size.width < size.height {
            size.width = size.height
        }
        return size
    }
}
