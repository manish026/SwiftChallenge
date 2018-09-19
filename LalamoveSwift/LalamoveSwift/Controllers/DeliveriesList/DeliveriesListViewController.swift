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
    var previousOffset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Text.Titles.deliveryListTitle
        setDeliveryView()
        getData()

    }
    
    /// sets up delivery view
    func setDeliveryView() {
        
        deliveryView = DeliveriesView(frame: view.frame)
        view.addSubview(deliveryView)
        
        view = deliveryView
        
        // Sets showDetail(for data: Deliveries) to didSelect closure, on calling didSelect, showDetail will get executed
        deliveryView.didSelect = showDetail
        // Sets getData(offset: Int) to prefetch closure, on calling prefetch, getData will get executed
        deliveryView.prefetch = getData

    }
    
    func getData(offset: Int) {
        
        if offset >= self.deliveryView.data.count, previousOffset != offset {
            previousOffset = self.offset
            self.offset = offset
            getData()
            
        }
        
    }
    
    /// Webservice call to get deleviry data
    func getData() {
        
        Webservice.getDeliveries(offsetBy: offset, onSuccess: { [unowned self] (model) in
            
            self.deliveryView.data.append(contentsOf: model)
            
        }) { [unowned self] (message) in
            
            let alert = UIAlertController(with: message)
            self.present(alert)
            
        }
        
    }
    
    /**
     Displays Detail view controller
     - Parameters:
        - data : data of type Deliveries for which details to be displayed
    */
    func showDetail(for data: Deliveries) {
        
        let controller = Controllers.deliveryDetail.rawValue as! DeliverDetailViewController
        controller.deliveryData = data
        self.navigationController?.show(controller, sender: nil)
        
    }

}


