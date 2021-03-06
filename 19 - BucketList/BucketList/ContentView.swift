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
  @State private var showingAuthenticationAlert = false
  @State private var authenticationError = ""
  
  var body: some View {
    ZStack {
      if isUnlocked {
        MapScreen(centerCoordinate: $centerCoordinate, locations: $locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, showingEditScreen: $showingEditScreen)
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
    .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
      if let selectedPlace = selectedPlace {
        EditView(placemark: selectedPlace)
      }
    }
    .onAppear(perform: loadData)
    .alert(isPresented: $showingAuthenticationAlert) {
      Alert(title: Text("Authentication Error"), message: Text(authenticationError), dismissButton: .cancel())
    }
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
            self.showingAuthenticationAlert = true
            self.authenticationError = authenticationError?.localizedDescription ?? "Unknown error."
          }
        }
      }
    } else {
      self.authenticationError = "Biometrics authentication unavailable."
      self.showingAuthenticationAlert = true
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
