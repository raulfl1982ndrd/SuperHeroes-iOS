//
//  TableViewCell.swift
//  SuperHeroes-iOS
//
//  Created by Mañanas on 12/9/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!

    func render(superHero: SuperHero) {
        nameLabel.text = superHero.name
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.roundCorners(radius: 8)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

