//
//  SimpleTableVCCell.swift
//  TableViews
//
//  Created by Arturs Vitins on 28/10/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class SimpleTableVCCell: UITableViewCell {
    
    var mainTVC: SimpleTableVC?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.backgroundColor = .green
        return label
        
    }()
    
    let actionBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //button.backgroundColor = .red
        return button
    }()
    
    func setupViews () {
        
        addSubview(cellLabel)
        addSubview(actionBtn)
        
        actionBtn.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: topAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: actionBtn.leadingAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            actionBtn.topAnchor.constraint(equalTo: topAnchor),
            actionBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionBtn.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionBtn.widthAnchor.constraint(equalToConstant: 120)
            ])
        
    }
    
    @objc func buttonAction (sender: UIButton) {
        mainTVC?.deleteCell(cell: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
