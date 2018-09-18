//
//  DeliveriesTableViewCell.swift
//  LalamoveSwift
//
//  Created by Manish on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

class DeliveriesTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func set(data: Deliveries) {
        self.textLabel?.text = data.descriptionField!
    }

}





