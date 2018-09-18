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

    }
    
    /// Webservice call to get deleviry data
    func getData() {
        
        Webservice.getDeliveries(offsetBy: 0, onSuccess: { [unowned self] (model) in
            self.deliveryView.data = model
        }) {
            print($0)
        }
        
    }
    
    func showDetail(for data: Deliveries) {
        
        let controller = Controllers.deliveryDetail.rawValue as! DeliverDetailViewController
        controller.deliveryData = data
        self.navigationController?.show(controller, sender: nil)
        
    }

}

