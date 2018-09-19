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
        labelDetail = UILabel(with: .zero, defaultText: Text.Messages.noDescription)
        
        addArrangedSubview(mapView!)
        addArrangedSubview(labelDetail)
        
        if UIDevice.current.orientation.isLandscape {
            // Landscape mode
            axis = .horizontal
        } else {
            // Portrait mode
            axis = .vertical
        }
        
        distribution = .fillEqually
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets details data
    
    func setData() {
        
        if let description = deliveryData.descriptionField {
            labelDetail.text = description
        }
        showMapData()
        
    }
    
    /// Displays marker on map
    
    func showMapData() {
        guard let location = deliveryData.location else {
            return
        }
        let coordinates = CLLocationCoordinate2DMake(location.lat!, location.lng!)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = location.address
        let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mapView?.setRegion(region, animated: true)
        mapView?.addAnnotation(annotation)
        
    }
    

}
