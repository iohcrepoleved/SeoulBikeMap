//
//  BikeStation.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import Foundation
import CoreLocation


struct BikeStation : Hashable, Decodable {
    let stationLocation : StationLocation
    let stationId : String
    let stationName : String
    let stationLatitude : String
    let stationLongitude : String
    let stationAddress : String
    
    enum StationLocation : String, Decodable, CaseIterable, Identifiable {
        case 강서구
        case 양천구
        case 구로구
        case 은평구
        case 마포구
        case 영등포구
        case 금천구
        case 서대문구
        case 용산구
        case 동작구
        case 관악구
        case 강북구
        case 종로구
        case 중구
        case 서초구
        case 도봉구
        case 성북구
        case 동대문구
        case 성동구
        case 강남구
        case 노원구
        case 중랑구
        case 광진구
        case 송파구
        case 강동구
        
        var id : String {
            return self.rawValue
        }
    }
    
    var coordinate : CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(self.stationLatitude) ?? .zero,
                                      longitude: CLLocationDegrees(self.stationLongitude) ?? .zero)
    }
    
    enum CodingKeys : String, CodingKey {
        case stationLocation = "STA_LOC"
        case stationId = "RENT_NO"
        case stationName = "RENT_NM"
        case stationLatitude = "STA_LAT"
        case stationLongitude = "STA_LONG"
        case stationAddress = "STA_ADD1"
    }
    
}


/*
 
 {
                 "STA_LOC": "양천구",
                 "RENT_ID": "ST-1000",
                 "RENT_NO": "00729",
                 "RENT_NM": "서부식자재마트 건너편",
                 "RENT_ID_NM": "729. 서부식자재마트 건너편",
                 "HOLD_NUM": "10",
                 "STA_ADD1": "서울특별시 양천구 신정동 236 ",
                 "STA_ADD2": "서부식자재마트 건너편",
                 "STA_LAT": "37.51037979",
                 "STA_LONG": "126.86679840",
                 "START_INDEX": 0,
                 "END_INDEX": 0,
                 "RNUM": "3"
             }
 
 */
