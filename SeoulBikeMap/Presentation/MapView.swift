//
//  MapView.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI
import MapKit

struct AnnotationItem : Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination : CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotationItmes = [AnnotationItem]()
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear{
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01,
                                   longitudeDelta: 0.01)
        )
    }
    
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItmes = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let station0 = BikeStation(stationLocation: .양천구, stationId: "ST-1000", stationName: "서부식자재마트 건너편", stationLatitude: "37.51037979", stationLongitude: "126.86679840", stationAddress: "서울특별시 양천구 신정동 236")
        MapView(coordination:
                    CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(station0.stationLatitude) ?? .zero,
                        longitude: CLLocationDegrees(station0.stationLongitude) ?? .zero
                    )
        )
    }
}
