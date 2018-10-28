//
//  SimpleTableVC.swift
//  TableViews
//
//  Created by Arturs Vitins on 28/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class SimpleTableVC: UITableViewController {

    var items = ["item 1", "item 2", "item 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Simple table view"
        
        tableView.register(SimpleTableVCCell.self, forCellReuseIdentifier: "cellID")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return items.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
    
}
