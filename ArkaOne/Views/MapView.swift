//
//  MapView.swift
//  ArkaOne
//
//  Created by tandyys on 20/02/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    
    
    var body: some View {
        VStack {
            if let region = locationManager.region {
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
            }
        }
    }
}
