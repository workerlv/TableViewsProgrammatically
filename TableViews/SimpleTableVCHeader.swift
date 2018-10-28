//
//  SimpleTableVCHeader.swift
//  TableViews
//
//  Created by Arturs Vitins on 28/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class SimpleTableVCHeader: UITableViewHeaderFooterView {

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Header text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
        
    }()
    
    func setupViews () {
        
        addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: topAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
