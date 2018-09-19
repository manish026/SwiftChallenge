//
//  UITableView+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Enum of cell identifier for a cell
    
    enum TableViewCells: String {
        case deliveries
    }
    
    /**
     This method registers cell based on thier type
        - Parameters:
            - cell: Type of cell to register for example deliveries
     */
    
    func register(forCell cell : TableViewCells) {
        
        switch cell {
            
        case .deliveries:
            self.register(DeliveriesTableViewCell.self, forCellReuseIdentifier: cell.rawValue)
        
        }
        
    }
    
    /**
     This method deques cell based on thier type
     */
    
    func deque(cell: TableViewCells, for index: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: cell.rawValue, for: index)
    }
    
}
