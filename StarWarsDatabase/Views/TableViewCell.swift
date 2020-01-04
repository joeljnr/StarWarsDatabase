//
//  TableViewCell.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let labelInfo: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(rgb: Colors.darkGray)
        label.font = UIFont(name: "InterUI-Regular", size: 15)
        return label
    }()
    
    func setCell(info: String) {
        labelInfo.text = info
        setupViews()
    }
    
    func setupViews() {
        addSubview(labelInfo)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: labelInfo)
        addConstraintsWithFormat(format: "V:|-16-[v0]-16-|", views: labelInfo)
    }
    
}
