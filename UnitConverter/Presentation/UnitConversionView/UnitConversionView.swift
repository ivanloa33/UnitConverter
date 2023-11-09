//
//  UnitConversionView.swift
//  UnitConverter
//
//  Created by Ivan Lopez on 09/11/23.
//

import SwiftUI

struct UnitConversionView: View {
    
    private var selectedUnitDimension: UnitDimension
    @State private var convertFrom: Unit
    @State private var valueFrom = 0.0
    @State private var convertTo: Unit
    
    private var valueTo: String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        let source = NSMeasurement(doubleValue: valueFrom, unit: convertFrom)
        let convertedValue = source.converting(to: convertTo)
        return formatter.string(from: convertedValue)
    }
    
    init(selectedUnitDimension: UnitDimension) {
        self.selectedUnitDimension = selectedUnitDimension
        self.convertFrom = selectedUnitDimension.units[0]
        self.convertTo = selectedUnitDimension.units[0]
    }
    
    var body: some View {
            Form {
                Section("From:") {
                    TextField(String(), value: $valueFrom, format: .number)
                        .keyboardType(.numberPad)
                    Picker("From", selection: $convertFrom) {
                        ForEach(selectedUnitDimension.units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("To:") {
                    Picker("To", selection: $convertTo) {
                        ForEach(selectedUnitDimension.units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result from \(convertFrom.symbol) to \(convertTo.symbol):") {
                    Text(valueTo)
                }
            }
            .navigationTitle("Convert \(selectedUnitDimension.title) Units")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UnitConversionView(selectedUnitDimension: .length)
}
