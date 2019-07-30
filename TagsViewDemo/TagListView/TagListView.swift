//
//  TagListView.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

@IBDesignable
class TagListView: UIView {
    
    // MARK: Properties
    
    var tagTextColor: UIColor = .black {
        didSet {
            for tagView in tagViews {
                tagView.textColor = tagTextColor
            }
        }
    }
    
    var tagTextFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            for tagView in tagViews {
                tagView.textFont = tagTextFont
            }
            rearrangeViews()
        }
    }
    
    var tagLineBreakMode: NSLineBreakMode = .byTruncatingMiddle {
        didSet {
            for tagView in tagViews {
                tagView.titleLineBreakMode = tagLineBreakMode
            }
        }
    }
    
    var tagBackgroundColor: UIColor = .clear {
        didSet {
            for tagView in tagViews {
                tagView.tagBackgroundColor = tagBackgroundColor
            }
        }
    }
    
    var tagCornerRadius: CGFloat = 16 {
        didSet {
            for tagView in tagViews {
                tagView.cornerRadius = tagCornerRadius
            }
        }
    }
    
    var tagBorderWidth: CGFloat = 1 {
        didSet {
            for tagView in tagViews {
                tagView.borderWidth = tagBorderWidth
            }
        }
    }
    
    var tagBorderColor: UIColor = .lightGray {
        didSet {
            for tagView in tagViews {
                tagView.borderColor = tagBorderColor
            }
        }
    }
    
    var paddingY: CGFloat = 10 {
        didSet {
            for tagView in tagViews {
                tagView.paddingY = paddingY
            }
            rearrangeViews()
        }
    }
    
    var paddingX: CGFloat = 16 {
        didSet {
            for tagView in tagViews {
                tagView.paddingX = paddingX
            }
            rearrangeViews()
        }
    }
    
    var spacing: CGFloat = 12 {
        didSet {
            rearrangeViews()
        }
    }
    
    // MARK: Interface Builder
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setTags([
            Tag(title: "This", selected: false),
            Tag(title: "Is", selected: false),
            Tag(title: "TagListView", selected: true)
            ])
    }
    
    // MARK: Private implementation
    
    private(set) var tagViews: [TagButton] = []
    private(set) var rowViews: [UIView] = []
    private(set) var tagViewHeight: CGFloat = 0
    private(set) var rows = 0
    
    private func rearrangeViews() {
        let views: [UIView] = tagViews + rowViews
        for view in views {
            view.removeFromSuperview()
        }
        rowViews.removeAll(keepingCapacity: true)
        
        var currentRow = 0
        var currentRowView: UIView!
        var currentRowTagsCount = 0
        var currentRowWidth: CGFloat = 0
        
        for view in tagViews {
            
            var size = view.intrinsicContentSize
            
            if currentRowTagsCount == 0 || (currentRowWidth + size.width + spacing) > bounds.width {
                currentRow += 1
                currentRowWidth = 0
                currentRowTagsCount = 0
                currentRowView = UIView()
                
                currentRowView.frame.origin = CGPoint(x: 0, y: 0 + CGFloat(currentRow - 1) * (tagViewHeight + spacing))
                
                rowViews.append(currentRowView)
                addSubview(currentRowView)
                
                size.width = min(size.width, bounds.width)
            }
            
            view.frame.size = size
            
            let viewX = currentRowTagsCount == 0 ? currentRowWidth : (currentRowWidth + spacing)
            view.frame.origin = CGPoint(x: viewX, y: 0)
            tagViewHeight = size.height
            
            currentRowView.addSubview(view)
            
            let additionalRowWidth = currentRowTagsCount == 0 ? view.bounds.width : (view.bounds.width + spacing)
            currentRowWidth += additionalRowWidth
            
            currentRowTagsCount += 1
            
            currentRowView.frame.size.width = currentRowWidth
            currentRowView.frame.size.height = max(tagViewHeight, currentRowView.frame.height)
        }
        rows = currentRow
        
        invalidateIntrinsicContentSize()
    }
    
    private func createNewTagView(_ tag: Tag) -> TagButton {
        let tagView = TagButton(tag: tag)
        
        tagView.textColor = tagTextColor
        tagView.tagBackgroundColor = tagBackgroundColor
        tagView.titleLineBreakMode = tagLineBreakMode
        tagView.cornerRadius = tagCornerRadius
        tagView.borderWidth = tagBorderWidth
        tagView.borderColor = tagBorderColor
        tagView.paddingX = paddingX
        tagView.paddingY = paddingY
        tagView.textFont = tagTextFont
        return tagView
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rearrangeViews()
    }
    
    override var intrinsicContentSize: CGSize {
        var height = CGFloat(0)
        if rows > 0 {
            height =  tagViewHeight * CGFloat(rows) + spacing * CGFloat(rows - 1)
        }
        return CGSize(width: bounds.width, height: height)
    }
    
    // MARK: Interface
    
    func setTags(_ tags: [Tag]) {
        for view in tagViews {
            view.removeFromSuperview()
        }
        
        tagViews = tags.map { createNewTagView($0) }
        rearrangeViews()
    }
}
