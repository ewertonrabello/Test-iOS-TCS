//
//  StatementsRouter.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

@objc protocol StatementsRoutingLogic {
    
}

protocol StatementsDataPassing {
    var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing {
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?
}
