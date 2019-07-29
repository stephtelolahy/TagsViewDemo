//
//  TagsCell.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

class TagsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagListView: TagListView!
    
    func update(with title: String, tags: [String]) {
        nameLabel.text = title
        tagListView.removeAllTags()
        tagListView.addTags(tags)
    }

}
