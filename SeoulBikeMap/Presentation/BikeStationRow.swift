//
//  BikeStationRow.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI

struct BikeStationRow: View {
    var bikeStation : BikeStation
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text(bikeStation.stationName)
                    .font(.headline)
                Text(bikeStation.stationId)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(bikeStation.stationAddress)
                .font(.footnote)
            
        }
        .padding()
    }
}

struct BikeStationRow_Previews: PreviewProvider {
    static var previews: some View {
        let bikeStation0 = BikeStation(stationLocation: .양천구, stationId: "ST-1000", stationName: "서부식자재마트 건너편", stationLatitude: "37.51037979", stationLongitude: "126.86679840", stationAddress: "서울특별시 양천구 신정동 236")
        BikeStationRow(bikeStation: bikeStation0)
    }
}
