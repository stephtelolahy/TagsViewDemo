//
//  TagsCell.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

class TagsCell: UITableViewCell {

    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagListView: TagListView!
    
    var expandDidToggle: (() -> Void)?
    
    func update(with item: Item) {
        nameLabel.text = item.title
        tagListView.maxRowsCount = item.expanded ? 0 : 2
        expandButton.setTitle(item.expanded ? "Voir moins" : "Voir plus", for: .normal)
        tagListView.setTags(item.tags)
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: Any) {
        expandDidToggle?()
    }
}
