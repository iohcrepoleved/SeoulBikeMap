//
//  SelectRegionViewModel.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import Foundation
import Combine

class SelectRegionViewModel : ObservableObject {
    @Published var bikeStations = [BikeStation.StationLocation: [BikeStation]]()
    private var cancellables = Set<AnyCancellable>()    //disposeBag
    
    init(bikeStationNetwork: BikeStationNetwork = BikeStationNetwork()) {
        bikeStationNetwork.getBikeStationList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {[weak self] in
                      guard case .failure(let error) = $0 else {return}
                      print(error.localizedDescription)
                      self?.bikeStations = [BikeStation.StationLocation: [BikeStation]]()
                  },
                    receiveValue: {[weak self] bikeStations in
                        self?.bikeStations = Dictionary(grouping: bikeStations){ $0.stationLocation }
                    }
            )
            .store(in: &cancellables)   //disposed(by:disposeBag)
    }
}
