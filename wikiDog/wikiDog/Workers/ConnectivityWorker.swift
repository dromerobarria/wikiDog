//
//  ConnectivityWorker.swift
//  wikiDog
//
//  Created by Daniel Romero on 25-11-19.
//  Copyright © 2019 Dromero. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
  class var isConnectedToInternet:Bool {
    return NetworkReachabilityManager()!.isReachable
  }
}
