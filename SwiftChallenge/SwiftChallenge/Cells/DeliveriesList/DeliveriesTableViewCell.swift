//
//  DeliveriesTableViewCell.swift
//  LalamoveSwift
//
//  Created by Manish on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit
import AlamofireImage
import SnapKit

class DeliveriesTableViewCell: UITableViewCell {
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.numberOfLines = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Deliveries) {

        self.textLabel?.text = data.descriptionField!
        
        if let imgUrlString = data.imageUrl, let imgUrl = URL(string: imgUrlString) {
            
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
                size: CGSize(width: 50, height: 50),
                radius: 20.0
            )
            
            imageView?.af_setImage(
                withURL: imgUrl,
                placeholderImage: #imageLiteral(resourceName: "placeholder"),
                filter: filter)
            
            
        }
    }

}





