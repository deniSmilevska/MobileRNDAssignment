//
//  CityTableViewCell.swift
//  MobileRNDAssignment
//
//  Created by Deni Smilevska on 6/8/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(city: City){
        self.cityNameLabel?.text = city.description
        self.coordinatesLabel?.text = city.coord.description
    }

}
