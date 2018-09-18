//
//  DeliverDetailViewController.swift
//  LalamoveSwift
//
//  Created by APPLE on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

class DeliverDetailViewController: UIViewController {
    
    var deliveryData: Deliveries!
    var deliveryDetailView: DeliveryDetailView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailView()
    }
    
    func setupDetailView() {
        deliveryDetailView = DeliveryDetailView(frame: view.frame)
        deliveryDetailView.deliveryData = deliveryData
        view = deliveryDetailView
    }

}
