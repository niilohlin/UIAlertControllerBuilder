//
//  UIAlertController+Builder.swift
//  UIAlertControllerBuilder
//
//  Created by Niil Öhlin on 2017-06-22.
//  Copyright © 2017 Niil Öhlin. All rights reserved.
//

import Foundation

extension UIAlertController {
    public class func alertController(_ setupBuilder: ((UIAlertControllerBuilder) -> Void)) -> UIAlertController {
        let builder = UIAlertControllerBuilder()
        setupBuilder(builder)
        let alertController = UIAlertController(title: builder.title, message: builder.message, preferredStyle: builder.style)
        for actionBuilder in builder.alertActionBuilders {
            alertController.addAction(actionBuilder.build())
        }
        return alertController
    }
}

