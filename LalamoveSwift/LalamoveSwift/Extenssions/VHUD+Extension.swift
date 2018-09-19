//
//  VHUD+Extension.swift
//  LalamoveSwift
//
//  Created by Manish on 20/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import VHUD


extension VHUD {
    
    static func show() {
        var content = VHUDContent(.loop(3.0))
        content.shape = .round
        content.style = .blur(.light)
        show(content)
    }
    
}
