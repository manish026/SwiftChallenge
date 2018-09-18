//
//  DeliverDetailViewController.swift
//  LalamoveSwift
//
//  Created by Manish on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit

class DeliverDetailViewController: UIViewController {
    
    var deliveryData: Deliveries!
    private var deliveryDetailView: DeliveryDetailView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailView()
    }
    
    func setupDetailView() {
        deliveryDetailView = DeliveryDetailView(frame: view.frame)
        deliveryDetailView.deliveryData = deliveryData
        view = deliveryDetailView
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if size.width > size.height {
            deliveryDetailView.axis = .horizontal
        }else {
            deliveryDetailView.axis = .vertical
        }
    }

}
