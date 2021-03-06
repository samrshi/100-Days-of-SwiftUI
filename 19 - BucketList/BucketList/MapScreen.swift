//
//  MapScreen.swift
//  BucketList
//
//  Created by Samuel Shi on 3/6/21.
//  Copyright © 2021 samrshi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapScreen: View {
  @Binding var centerCoordinate: CLLocationCoordinate2D
  @Binding var locations: [CodableMKPointAnnotation]
  @Binding var selectedPlace: MKPointAnnotation?
  @Binding var showingPlaceDetails: Bool
  @Binding var showingEditScreen: Bool
  
  var body: some View {
    ZStack {
      MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
        .edgesIgnoringSafeArea(.all)
      Circle()
        .fill(Color.blue)
        .opacity(0.3)
        .frame(width: 32, height: 32)
      
      VStack {
        Spacer()
        HStack {
          Spacer()
          Button(action: {
            let newLocation = CodableMKPointAnnotation()
            newLocation.title = ""
            newLocation.coordinate = centerCoordinate
            locations.append(newLocation)
            
            self.selectedPlace = newLocation
            self.showingEditScreen = true
          }) {
            Image(systemName: "plus")
              .padding()
              .background(Color.black)
              .foregroundColor(.white)
              .font(.title)
              .clipShape(Circle())
              .padding(.trailing)
          }
          
        }
      }
    }
    .alert(isPresented: $showingPlaceDetails) {
      Alert(
        title: Text(selectedPlace?.title ?? "Unknown"),
        message: Text(selectedPlace?.subtitle ?? "Missing place information."),
        primaryButton: .default(Text("OK")),
        secondaryButton: .default(Text("Edit")) {
          self.showingEditScreen = true
        }
      )
    }
  }
}
