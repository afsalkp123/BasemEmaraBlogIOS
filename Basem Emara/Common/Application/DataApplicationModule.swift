//
//  DataApplicationService.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-19.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress
import ZamzamUI

final class DataApplicationModule: ApplicationModule {
    @Inject private var dataWorker: DataWorkerType
}

extension DataApplicationModule {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        dataWorker.configure()
        return true
    }
}
