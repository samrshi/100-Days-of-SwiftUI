//
//  ContentView.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import LocalAuthentication
import SwiftUI
import MapKit

struct ContentView: View {
  @State private var centerCoordinate = CLLocationCoordinate2D()
  @State private var locations = [CodableMKPointAnnotation]()
  @State private var selectedPlace: MKPointAnnotation?
  @State private var showingPlaceDetails = false
  @State private var showingEditScreen = false
  @State private var isUnlocked = false
  
  var body: some View {
    ZStack {
      if isUnlocked {
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
              newLocation.title = "Example Location"
              newLocation.coordinate = centerCoordinate
              locations.append(newLocation)
              
              self.selectedPlace = newLocation
              self.showingEditScreen = true
            }) {
              Image(systemName: "plus")
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding(.trailing)
          }
        }
      } else {
        Button("Unlock Places") {
          authenticate()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
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
    .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
      if let selectedPlace = selectedPlace {
        EditView(placemark: selectedPlace)
      }
    }
    .onAppear(perform: loadData)
  }
  
  func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func loadData() {
    let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
    
    do {
      let data = try Data(contentsOf: filename)
      locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
    } catch {
      print("Unable to load saved data.")
    }
  }
  
  func saveData() {
    do {
      let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
      let data = try JSONEncoder().encode(locations)
      try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
    } catch {
      print("Unable to save data.")
    }
  }
  
  func authenticate() {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      let reason = "Please authenticate yourself to unlock your places."
      
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
        DispatchQueue.main.async {
          if success {
            self.isUnlocked = true
          } else {
            // error
          }
        }
      }
    } else {
      // no biometrics
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
