//
//  DeliveryDetailView.swift
//  LalamoveSwift
//
//  Created by APPLE on 18/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import UIKit
import MapKit

class DeliveryDetailView: UIStackView {

    private var mapView: MKMapView?
    private var labelDetail: UILabel!
    
    
    var deliveryData: Deliveries! {
        didSet {
            setData()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mapView = MKMapView(frame: .zero)
        labelDetail = UILabel(frame: .zero)
        addArrangedSubview(mapView!)
        addArrangedSubview(labelDetail)
        axis = .vertical
        distribution = .fillEqually
        labelDetail.center = CGPoint(x: 160, y: 285)
        labelDetail.textAlignment = .center
        labelDetail.backgroundColor = .white
        labelDetail.text = "No description available"
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData() {
        
        if let description = deliveryData.descriptionField {
            labelDetail.text = description
        }
        
        let location = CLLocationCoordinate2DMake((deliveryData.location?.lat!)!, (deliveryData.location?.lng!)!)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = deliveryData.location?.address
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mapView?.setRegion(region, animated: true)
        mapView?.addAnnotation(annotation)
        
        
    }
    

}
