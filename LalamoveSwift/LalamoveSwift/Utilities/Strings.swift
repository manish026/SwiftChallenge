//
//  Strings.swift
//  LalamoveSwift
//
//  Created by Manish on 18/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

/// Text is a struct where all strings/ messages are placed, if in future we want to add localized string we can add Localized.string and will change here

struct Text {
    
    /// Contains all the messages
    struct Messages {
        
        static let noDescription = "No description available"
        
    }
    
    /// Contains all the titles of controllers
    struct Titles {
        /// returns "Deliveries list"
        static let deliveryListTitle = "Deliveries list"
        /// returns "Delivery detail"
        static let deliveryDetailsTitle = "Delivery detail"
        
    }
    
}
