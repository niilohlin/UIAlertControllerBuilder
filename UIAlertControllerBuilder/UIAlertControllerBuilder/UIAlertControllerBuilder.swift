//
//  UIAlertControllerBuilder.swift
//  UIAlertControllerBuilder
//
//  Created by Niil Öhlin on 2017-06-22.
//  Copyright © 2017 Niil Öhlin. All rights reserved.
//

import Foundation
import UIKit

public class UIAlertControllerBuilder {
    public var title: String?
    public var message: String?
    public var style: UIAlertControllerStyle = .alert
    
    var alertActionBuilders: [UIAlertActionBuilder] = []
    
    public subscript(title: String) -> UIAlertActionBuilder {
        get {
            var builder = self.alertActionBuilders.first { $0.title == title }

            if builder == nil {
                self[title] = nil
                builder = self[title]
            }
            return builder ?? UIAlertActionBuilder()
        }
    }
    public subscript(title: String) -> ((UIAlertAction) -> Void)? {
        get {
            var builder = self.alertActionBuilders.first { $0.title == title }

            if builder == nil {
                self[title] = nil
                builder = self[title]
            }
            return builder?.handler
        }
        
        set(handler){
            let builder = UIAlertActionBuilder()
            builder.title = title
            builder.handler = handler
            builder.style = .default
            self.alertActionBuilders.append(builder)
        }
    }
    
}
