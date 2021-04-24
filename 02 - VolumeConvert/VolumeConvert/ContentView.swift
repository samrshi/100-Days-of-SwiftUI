//
//  ContentView.swift
//  VolumeConvert
//
//  Created by hawkeyeshi on 5/31/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    private var unitsArray = [Units.millileters, Units.liters, Units.cups, Units.pints, Units.gallons]
    private var unitsStrArray = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    enum Units {
        case millileters
        case liters
        case cups
        case pints
        case gallons
    }
    
    var output: Double {
        let inputDouble = Double(inputValue) ?? 0.0
        let unitInput = unitsArray[inputUnit]
        
        var inputML: Double
        
        switch unitInput {
        case Units.millileters:
            inputML = inputDouble
        case Units.liters:
            inputML = inputDouble * 1000
        case Units.cups:
            inputML = inputDouble * 236.588
        case Units.pints:
            inputML = inputDouble * 473.176000012798
        case Units.gallons:
            inputML = inputDouble * 3785.4080001023839941
        }
        
        let unitOutput = unitsArray[outputUnit]
        var outputDouble: Double
        
        switch unitOutput {
        case Units.millileters:
            outputDouble = inputML
        case Units.liters:
            outputDouble = inputML / 1000
        case Units.cups:
            outputDouble = inputML / 236.588
        case Units.pints:
            outputDouble = inputML / 473.176000012798
        case Units.gallons:
            outputDouble = inputML / 3785.4080001023839941
        }
        
        return outputDouble
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Value and Unit")) {
                    TextField("Input Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< unitsArray.count) {
                            Text("\(self.unitsStrArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Input Unit", selection: $outputUnit) {
                        ForEach(0 ..< unitsArray.count) {
                            Text("\(self.unitsStrArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Text("\(output, specifier: "%g")")
                }
            }
        .navigationBarTitle("Volume Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
