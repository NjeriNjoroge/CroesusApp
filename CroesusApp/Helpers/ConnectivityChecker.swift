//
//  ConnectivityChecker.swift
//  CroesusApp
//
//  Created by Grace Njoroge on 23/04/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
  class func isConnectedToInternet() -> Bool {
    return NetworkReachabilityManager()?.isReachable ?? false
  }
}
