//
//  ContentView.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
  @State private var centerCoordinate = CLLocationCoordinate2D()
  @State private var locations = [MKPointAnnotation]()
  @State private var selectedPlace: MKPointAnnotation?
  @State private var showingPlaceDetails = false
  
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
            let newLocation = MKPointAnnotation()
            newLocation.title = "Example Location"
            newLocation.coordinate = centerCoordinate
            locations.append(newLocation)
          }) {
            Image(systemName: "plus")
          }
          .padding()
          .background(Color.black)
          .foregroundColor(.white)
          .font(.title)
          .clipShape(Circle())
          .padding()
        }
      }
    }
    .alert(isPresented: $showingPlaceDetails) {
      Alert(
        title: Text(selectedPlace?.title ?? "Unknown"),
        message: Text(selectedPlace?.subtitle ?? "Missing place information."),
        primaryButton: .default(Text("OK")),
        secondaryButton: .default(Text("Edit")) {
        // edit this place
        }
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
