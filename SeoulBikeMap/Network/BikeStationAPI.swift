//
//  BikeStationAPI.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import Foundation
import Combine

struct BikeStationAPI {
    static let scheme = "http"
    static let host = "openapi.seoul.go.kr"
    static let path = "/414c797a6f61726138325871537244/json/tbCycleStationInfo/1/1000/"
    static let port = 8088
    
    func getBikeStationListComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = BikeStationAPI.scheme
        components.host = BikeStationAPI.host
        components.path = BikeStationAPI.path
        components.port = BikeStationAPI.port
        return components
    }
}
