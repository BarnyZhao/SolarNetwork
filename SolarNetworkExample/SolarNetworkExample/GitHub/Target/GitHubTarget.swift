//
//  GitHubTarget.swift
//  SolarKit-SwiftExample
//
//  Created by wyh on 2018/1/12.
//  Copyright © 2018年 SolarKit. All rights reserved.
//

import Foundation
import SolarNetwork

struct GitHubTarget: SLTarget {

    var baseURLString: String { return "https://api.github.com" }
    
    var IPURLString: String? {
        get {
            return storeIPURLString
        }
        set {
            storeIPURLString = newValue
        }
    }
    
    var parameterEncoding: ParameterEncoding { return JSONEncoding.default }
    
    var policies: [String : ServerTrustPolicy]? {
        
        #if DEBUG
            let validateCertificateChain = false
            let validateHost = false
        #else
            let validateCertificateChain = true
            let validateHost = true
        #endif
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            host: .pinCertificates(
                certificates: ServerTrustPolicy.certificates(),
                validateCertificateChain: validateCertificateChain,
                validateHost: validateHost
            )
        ]
        return serverTrustPolicies
        
    }
    
    var plugins: [SLPlugin]? {
        return [GitHubPlugin()]
    }
    
    var storeIPURLString: String?
    
}

//"api.github.com"
//"https://192.30.255.117"

