//
//  TitleCell.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func set(font: UIFont, text: String?) {
        label.font = font
        label.text = text
    }
    
}
