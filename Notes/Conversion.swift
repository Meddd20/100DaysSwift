//
//  Conversion.swift
//  Notes
//
//  Created by Medhiko Biraja on 22/03/25.
//

import SwiftUI

struct Conversion: View {
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let timeUnits = ["Second", "Minute", "Hour", "Day"]
    @State private var selectedTemperatureUnit = "Celsius"
    @State private var temperaturevalue: Double?
    @State private var convertedTemperatureUnit: String = "Fahrenheit"
    
    @State private var selectedTimeUnit = "Second"
    @State private var timevalue: Int?
    @State private var convertedTimeUnit: String = "Minute"
    
    var chooseTheConversionUnitLeft: [String] {
        temperatureUnits.filter { $0 != selectedTemperatureUnit}
    }
    
    var chooseTheConversionTimeUnitLeft: [String] {
        timeUnits.filter {$0 != selectedTimeUnit}
    }
    
    var conversionTemperatureValue: Double?{
        guard let tempValue = temperaturevalue else {
            return nil
        }
        
        switch (selectedTemperatureUnit, convertedTemperatureUnit) {
        case ("Celsius", "Fahrenheit"):
            return (tempValue * 9/5) + 32
        case ("Celsius", "Kelvin"):
            return tempValue + 273.15
        case ("Fahrenheit", "Celsius"):
            return (tempValue - 32) * 5/9
        case ("Fahrenheit", "Kelvin"):
            return (tempValue + 459.67) * 5/9
        case ("Kelvin", "Celsius"):
            return tempValue - 273.15
        case ("Kelvin", "Fahrenheit"):
            return (tempValue * 9/5) - 459.67
        default:
            return nil
        }
    }
    
    var conversionTimevalue: Double? {
        guard let value = timevalue else {
            return nil
        }
        
        switch (selectedTimeUnit, convertedTimeUnit) {
        case ("Second", "Minute"):
            return Double(value) / 60
        case ("Second", "Hour"):
            return Double(value) / 3600
        case ("Second", "Day"):
            return Double(value) / 86400
        case ("Minute", "Second"):
            return Double(value) * 60
        case ("Minute", "Hour"):
            return Double(value) * 60
        case ("Minute", "Day"):
            return Double(value) * 1440
        case ("Hour", "Second"):
            return Double(value) * 3600
        case ("Hour", "Minute"):
            return Double(value) * 60
        case ("Hour", "Day"):
            return Double(value) * 24
        case ("Day", "Second"):
            return Double(value) * 86400
        case ("Day", "Minute"):
            return Double(value) * 1440
        case ("Day", "Hour"):
            return Double(value) * 24
        default:
            return nil
        }
    }
        
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select the unit you want to convert from", selection: $selectedTemperatureUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Enter the temperature value", value: $temperaturevalue, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Temperature Conversion")
                }
                
                Section{
                    Picker("Select the unit you want \ninto convert to", selection: $convertedTemperatureUnit) {
                        ForEach(chooseTheConversionUnitLeft, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Text("\(conversionTemperatureValue ?? 0, specifier: "%.2f")")
                } header: {
                    Text("Converted Temperature")
                }
                
                Section{
                    Picker("Select time unit", selection: $selectedTimeUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Enter time value", value: $timevalue, format: .number).keyboardType(.numberPad)
                }header: {
                    Text("Time Conversion")
                }
                
                Section{
                    Picker("Select converted time unit", selection: $convertedTimeUnit) {
                        ForEach(chooseTheConversionTimeUnitLeft, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Text("\(conversionTimevalue ?? 0.0, specifier: "%.1f")")
                } header: {
                    Text("Converted Time")
                }
            }
        }
    }
}


#Preview {
    Conversion()
}
