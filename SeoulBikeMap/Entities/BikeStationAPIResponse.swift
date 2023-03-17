//
//  BikeStationAPIResponse.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import Foundation

struct BikeStationAPIResponse : Decodable {
    var stations : [BikeStation] { stationInfo.row }
    let stationInfo : stationInfoModel
    
    struct stationInfoModel : Decodable {
        var row : [BikeStation] = []
    }
}


