//
//  BikeStationDetailView.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI
import MapKit

struct BikeStationDetailView: View {
    var bikeStation : BikeStation
    var body: some View {
        VStack {
            MapView(coordination: bikeStation.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            BikeStationRow(bikeStation: bikeStation)
        }
        .navigationTitle(bikeStation.stationName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BikeStationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let station0 = BikeStation(stationLocation: .양천구, stationId: "ST-1000", stationName: "서부식자재마트 건너편", stationLatitude: "37.51037979", stationLongitude: "126.86679840", stationAddress: "서울특별시 양천구 신정동 236")
        BikeStationDetailView(bikeStation: station0)
    }
}
