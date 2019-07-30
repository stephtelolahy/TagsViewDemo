//
//  ViewController.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let items: [Item] = [
        Item(title: "Les bonnes affaires",
             tags: [Tag(title: "Soldes", selected: false),
                    Tag(title: "Les bons plans", selected: false),
                    Tag(title: "Exclusivités internet", selected: false),
                    Tag(title: "Nouveautés", selected: true),
                    Tag(title: "Pack économiques", selected: false)]),
        Item(title: "Lorem Ipsum",
             tags: [Tag(title: "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet", selected: false),
                    Tag(title: "a", selected: false),
                    Tag(title: "b", selected: false),
                    Tag(title: "c", selected: false),
                    Tag(title: "d", selected: false),
                    Tag(title: "e", selected: false),
                    Tag(title: "f", selected: false),
                    Tag(title: "g", selected: false),
                    Tag(title: "h", selected: false),
                    Tag(title: "i", selected: false)])
    ]
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagsCell", for: indexPath) as! TagsCell
        cell.update(with: items[indexPath.row])
        return cell
    }
}

