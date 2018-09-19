//
//  UIViewcontroller+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 19/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// present controller
    func present(_ controller : UIViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    /// dismiss controller
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /// dismiss controller with completion
    func dismiss(with completion: (() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
    }
    
}
