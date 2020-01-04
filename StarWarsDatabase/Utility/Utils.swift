//
//  Utilities.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import Foundation
import Alamofire

struct Colors {
    static let gray = 0x272A2F
    static let darkGray = 0x1D1E22
    static let yellow = 0xFCDF39
}

class Utils {
    // verifica a conexão com a internet
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

