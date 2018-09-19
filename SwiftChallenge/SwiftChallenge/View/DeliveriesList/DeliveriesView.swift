//
//  DeliveriesView.swift
//  LalamoveSwift
//
//  Created by Manish on 15/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit
import SnapKit

class DeliveriesView: UIStackView {

    private var tableView: UITableView!
    
    var didSelect: ((Deliveries) -> ())?
    var prefetch: ((Int)->())?
    
    var data : [Deliveries] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTable(with: frame)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     Sets up tableview to show deliveries data
     - Parameters:
        - frame: Pass frame for UITableView
     */
    
    func setTable(with frame: CGRect) {
        
        tableView = UITableView()
        addArrangedSubview(tableView)
        tableView.register(forCell: .deliveries)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
}

extension DeliveriesView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(cell: .deliveries, for: indexPath) as! DeliveriesTableViewCell
        cell.set(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        
        if index >= data.count - 5  {
            let offset  = ((index + 3) / Constants.fetchLimit) * Constants.fetchLimit
            prefetch!(offset)
        }
        
    }
    
}

extension DeliveriesView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let select = didSelect {
            select(data[indexPath.row])
        }
    }
    
}

