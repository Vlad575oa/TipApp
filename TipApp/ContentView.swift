//
//  ContentView.swift
//  TipApp
//
//  Created by user on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0

    let tipPercentages = [0,5,10,15,20]
    
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", text: $checkAmount)
                    .foregroundColor(.blue)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<30) {
                            Text("\($0) people")
                        }
                    }
                }
                Section (header: Text("Hom much tip do you want to leave")) {
                    Picker("Tip percantage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count, id: \.self) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    Section {
                        Text("\(totalPerson, specifier: "%.2f")")
                    }
                }
            .navigationBarTitle("Tip calculator", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
