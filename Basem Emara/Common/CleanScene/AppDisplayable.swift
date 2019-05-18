//
//  AppDisplayable.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-08-27.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import ZamzamKit

extension AppDisplayable where Self: UIViewController {
    
    func endRefreshing() {
        #if !(WIDGET_EXT)
        hideSpinner()
        #endif
    }
}
