//
//  DeliveriesView.swift
//  LalamoveSwift
//
//  Created by Manish on 15/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit
import SnapKit

class DeliveriesView: UIView {

    private var tableView: UITableView!
    private var stackView: UIStackView!
    
    var didSelect: ((Deliveries) -> Void)?
    
    var data : [Deliveries]? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView(with: frame)
        setTable(with: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     Sets up parent stackview, add all your views inside this stackview
     
     - Parameters:
        - frame: Pass frame for UIStackView
     */
    
    func setStackView(with frame: CGRect) {
        stackView = UIStackView()
        addSubview(stackView)
        stackView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    /**
     Sets up tableview to show deliveries data
     - Parameters:
        - frame: Pass frame for UITableView
     */
    
    func setTable(with frame: CGRect) {
        
        tableView = UITableView()
        stackView.addArrangedSubview(tableView)
        tableView.register(forCell: .deliveries)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        
    }
    
    
}

extension DeliveriesView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(cell: .deliveries, for: indexPath) as! DeliveriesTableViewCell
        cell.set(data: data![indexPath.row])
        return cell
    }
    
}

extension DeliveriesView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let select = didSelect {
            select(data![indexPath.row])
        }
    }
    
}
