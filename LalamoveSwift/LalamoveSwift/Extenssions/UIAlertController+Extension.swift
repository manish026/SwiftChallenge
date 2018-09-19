//
//  UIAlertController+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 19/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /**
     This is a convenience init method which initializes the alert with "Error" message as title and sets message & adds a cancel button with title "Dismiss"
     */
    
    convenience init(with message: String) {
        self.init(title: "Error", message: message, preferredStyle: .alert)
       
        let cancel = UIAlertAction(title: "Dismiss", style: .cancel, handler: { (action) in
            self.dismiss()
        })
        self.addAction(cancel)
    }
    
}
