//
//  ViewControllers.swift
//  LalamoveSwift
//
//  Created by APPLE on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

enum Controllers {
    
    case deliveryList, deliveryDetail
    
    var rawValue: UIViewController {
        
        switch self {
            
        case .deliveryList:
            return DeliveriesListViewController()
        
        case .deliveryDetail:
            return DeliverDetailViewController()
        }
        
    }
    
}
