//
//  PizzaCell.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
    
    func set(place: PizzaVenue?) {
        guard let place = place else { return }
        self.nameLabel.text = place.venue.name
        self.adressLabel.text = place.venue.location.address
    }
    
}
private extension PizzaCell {
    func clear() {
        self.nameLabel.text = nil
        self.adressLabel.text = nil
    }
}
