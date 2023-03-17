//
//  SelectRegionItem.swift
//  SeoulBikeMap
//
//  Created by 최아람 on 2023/03/04.
//

import SwiftUI

struct SelectRegionItem: View {
    var region : BikeStation.StationLocation
    var count : Int
    
    var body: some View {
        ZStack{
            Color(white: 0.9)
            VStack{
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text("(\(count))")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SelectRegionItem_Previews: PreviewProvider {
    static var previews: some View {
        let region0 = BikeStation.StationLocation.강남구
        SelectRegionItem(region: region0, count: 23)
    }
}
