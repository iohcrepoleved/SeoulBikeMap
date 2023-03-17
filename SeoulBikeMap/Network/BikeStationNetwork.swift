//
//  BikeStationNetwork.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import Foundation
import Combine
class BikeStationNetwork {
    private let session : URLSession
    let api = BikeStationAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getBikeStationList() -> AnyPublisher<[BikeStation], URLError> {
        guard let url = api.getBikeStationListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300 :
                    return data
                case 400..<500 :
                    throw URLError(.clientCertificateRejected)
                case 500..<599 :
                    throw URLError(.badServerResponse)
                default :
                    throw URLError(.unknown)
                }
            }
            .decode(type: BikeStationAPIResponse.self, decoder: JSONDecoder())
            .map{ $0.stations }
            .mapError{ $0 as? URLError ?? URLError(.unknown) }
            .eraseToAnyPublisher()
    }
}
