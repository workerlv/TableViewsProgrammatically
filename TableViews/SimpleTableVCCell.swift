//
//  SimpleTableVCCell.swift
//  TableViews
//
//  Created by Arturs Vitins on 28/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class SimpleTableVCCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
