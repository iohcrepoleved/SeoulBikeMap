//
//  SelectRegionView.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI

struct SelectRegionView: View {
    @ObservedObject var viewModel = SelectRegionViewModel()
    
    private var items: [GridItem]{
        Array(repeating: .init(.flexible(minimum:80)), count: 3)
    }
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(BikeStation.StationLocation.allCases, id: \.id){ stationLocation in
                        let stations = viewModel.bikeStations[stationLocation] ?? []
                        NavigationLink(destination: BikeStationList(bikeStations: stations)) {
                            SelectRegionItem(region: stationLocation, count: stations.count)
                        }
                    }
                }
                .padding()
                .navigationTitle("따릉이 대여소 정보🚲")
            }
        }
    }
}

struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
