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
        
        headerSetup()
        
        insertDeleteSetup()
        
        insertBatchSetup()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return items.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! SimpleTableVCCell
        
        //cell.textLabel?.text = items[indexPath.row] //without custom cell settings
        
        cell.cellLabel.text = items[indexPath.row]
        
        cell.mainTVC = self

        return cell
    }
    
}

extension SimpleTableVC {
    //Header
    
    func headerSetup () {
        tableView.register(SimpleTableVCHeader.self, forHeaderFooterViewReuseIdentifier: "headerID")
        tableView.sectionHeaderHeight = 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerID")
    }
    
}

extension SimpleTableVC {
    //Custom "insert" and "delete"
    
    func insertDeleteSetup () {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: #selector(insert))
    }
    
    @objc func insert () {
        items.append("Item \(items.count + 1)")
        
        let insertIndexPath = NSIndexPath(row: items.count - 1, section: 0)

        tableView.insertRows(at: [insertIndexPath as IndexPath], with: .automatic)
    }
    
    func deleteCell (cell: UITableViewCell) {
        
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            items.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
    
}

extension SimpleTableVC {
    //Insert bach - for multiple object edditing
    
    func insertBatchSetup () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batch Insert", style: .plain, target: self, action: #selector(insertBatch))
    }
    
    @objc func insertBatch () {
        var indexPaths = [NSIndexPath]()
        
        for i in items.count...items.count + 5 {
            items.append("Item \(i + 1)")
            indexPaths.append(NSIndexPath(row: i, section: 0))
            
        }
        
        var bottomHalfIndexPaths = [NSIndexPath]()
        
        for _ in 0...indexPaths.count / 2 - 1 {
            bottomHalfIndexPaths.append(indexPaths.removeLast())
        }
        
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths as [IndexPath], with: .right)
        tableView.insertRows(at: bottomHalfIndexPaths as [IndexPath], with: .left)
        tableView.endUpdates()
        
        
    }
    
    
}
