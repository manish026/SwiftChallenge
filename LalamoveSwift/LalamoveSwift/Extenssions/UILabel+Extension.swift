//
//  UILabel+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 18/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(with frame: CGRect, defaultText string: String = "") {
        self.init(frame: frame)
        text = string
        textAlignment = .center
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
