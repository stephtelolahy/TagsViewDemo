//
//  ViewController.swift
//  TagsViewDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/29/19.
//  Copyright © 2019 creativegames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagsCell", for: indexPath) as! TagsCell
        cell.update(with: "Les bonnes affaires",
                    tags: ["Soldes",
                           "Les bons plans",
                           "Exclusivités internet",
                           "Nouveautés",
                           "moins de 1100 t/min de 1100 t/min à 1300 t/min plus de 1300 t/min",
                           "Pack économiques"])
        return cell
    }
}

