//
//  UIAlertActionBuilder.swift
//  UIAlertControllerBuilder
//
//  Created by Niil Öhlin on 2017-06-22.
//  Copyright © 2017 Niil Öhlin. All rights reserved.
//

import Foundation

public class UIAlertActionBuilder {
    var title: String? = nil
    var style: UIAlertActionStyle = .default
    var handler: ((UIAlertAction) -> Void)? = nil

    init() {

    }
    public subscript(style: UIAlertActionStyle) -> ((UIAlertAction) -> Void)? {
        get {
            return handler
        }
        set(handler){
            self.style = style
            self.handler = handler
        }
    }
    
    public func build() -> UIAlertAction {
        return UIAlertAction(title: self.title, style: self.style, handler: self.handler)
    }
}
