//
//  CustomTableViewCell.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/22/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // IBOutlet decorated variables -> these are wired up to the UI
    @IBOutlet var movieImage: UIImageView! // bang means MUST be concrete (no chance of nils)
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    
    @IBOutlet var favButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
