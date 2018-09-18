//
//  UITableView+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

extension UITableView {
    
    enum TableViewCells: String {
        case deliveries
    }
    
    func register(forCell cell : TableViewCells) {
        
        switch cell {
            
        case .deliveries:
            self.register(DeliveriesTableViewCell.self, forCellReuseIdentifier: cell.rawValue)
        
        }
        
    }
    
    func deque(cell: TableViewCells, for index: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: cell.rawValue, for: index)
    }
    
}
