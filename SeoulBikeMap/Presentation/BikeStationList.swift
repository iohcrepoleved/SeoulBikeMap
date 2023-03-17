//
//  BikeStationList.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI

struct BikeStationList: View {
    var bikeStations = [BikeStation]()
    var body: some View {
        List(bikeStations, id:\.stationId) { bikeStation in
            NavigationLink(destination: BikeStationDetailView(bikeStation: bikeStation)) {
                BikeStationRow(bikeStation: bikeStation)
            }
            .navigationTitle(bikeStation.stationLocation.rawValue)
        }
    }
}

struct BikeStationList_Previews: PreviewProvider {
    static var previews: some View {
        let bikeStations = [
            BikeStation(stationLocation: .양천구, stationId: "ST-1000", stationName: "서부식자재마트 건너편", stationLatitude: "37.51037979", stationLongitude: "126.86679840", stationAddress: "서울특별시 양천구 신정동 236"),
            BikeStation(stationLocation: .마포구, stationId: "ST-10", stationName: "서교동 사거리", stationLatitude: "37.55274582", stationLongitude: "126.91861725", stationAddress: "서울특별시 마포구 양화로 93"),
            BikeStation(stationLocation: .광진구, stationId: "ST-100", stationName: "더샵스타시티 C동 앞", stationLatitude: "37.53666687", stationLongitude: "127.07359314", stationAddress: "서울특별시 광진구 아차산로 262")
        ]
        BikeStationList(bikeStations: bikeStations)
    }
}
