//
//  ReturnMessage.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/21/24.
//

import Foundation

struct ReturnMessage{
    
    var alert: Bool
    var title: String
    var message: String
    var payload: Any
    
    init(alert: Bool = false, title: String = "Success", message: String = "Operation Success", payload: Any? = nil) {
        self.alert = alert
        self.title = title
        self.message = message
        self.payload = payload ?? "_null_"
    }
    
}
