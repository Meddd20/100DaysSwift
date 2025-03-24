//
//  SplitBills.swift
//  Notes
//
//  Created by Medhiko Biraja on 19/03/25.
//

import SwiftUI

struct SplitBills: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @State private var totalAmount = 0.0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var tipAmount: Double {
        let tipSelectedDouble = Double(tipPercentage)
        return (Double(checkAmount) * tipSelectedDouble) / 100
    }
    
    var amountWithTip: Double {
        let numberOfPeopleDouble = Double(numberOfPeople + 2)
        let amountWithTip = checkAmount + tipAmount
        
        return amountWithTip
    }
    
    var totalPerPerson: Double {
        return amountWithTip / Double(numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: "IDR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip would you like to leave?")
                }
                
                
                Section{
                    Text("Total Amount \(Double(checkAmount), format: .currency(code: "IDR"))")
                    Text("Tip Amount \(tipAmount, format: .currency(code: "IDR"))")
                    Text("Subtotal Amount \(amountWithTip, format: .currency(code: "IDR"))")
                    Text("Total per Person \(totalPerPerson, format: .currency(code: "IDR"))")
                }
                
                
            }
            .navigationTitle("Split Bills")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    SplitBills()
}
