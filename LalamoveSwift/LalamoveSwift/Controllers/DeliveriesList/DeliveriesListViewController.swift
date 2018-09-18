//
//  ViewController.swift
//  LalamoveSwift
//
//  Created by Manish on 14/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

class DeliveriesListViewController: UIViewController {

    var deliveryView: DeliveriesView!
    var offset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDeliveryView()
        getData()

    }
    
    /// sets up delivery view
    func setDeliveryView() {
        
        deliveryView = DeliveriesView(frame: view.frame)
        view.addSubview(deliveryView)
        
        view = deliveryView
        
        deliveryView.didSelect = showDetail
        
        deliveryView.prefetch = getData

    }
    
    func getData(offset: Int) {
        
        if offset >= self.deliveryView.data.count {
            
            self.offset = offset
            getData()
            
        }
        
    }
    
    /// Webservice call to get deleviry data
    func getData() {
        
        Webservice.getDeliveries(offsetBy: offset, onSuccess: { [unowned self] (model) in
            self.deliveryView.data.append(contentsOf: model) 
        }) {
            self.deliveryView.error = $0
        }
        
    }
    
    func showDetail(for data: Deliveries) {
        
        let controller = Controllers.deliveryDetail.rawValue as! DeliverDetailViewController
        controller.deliveryData = data
        self.navigationController?.show(controller, sender: nil)
        
    }

}

