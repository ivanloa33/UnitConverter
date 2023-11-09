//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ivan Lopez on 08/11/23.
//

import SwiftUI

enum UnitDimension: String, CaseIterable {
    case temperature
    case length
    case time
    case volume
    
    var icon: String {
        switch self {
        case .temperature:
            return "thermometer.medium"
        case .length:
            return "ruler"
        case .time:
            return "clock"
        case .volume:
            return "waterbottle"
        }
    }
    
    var units: [Unit] {
        switch self {
        case .temperature:
            return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        case .length:
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
        case .time:
            return [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours]
        case .volume:
            return [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
        }
    }
}

final class UnitDimensionsListViewModel {
    var unitDimensions: [UnitDimension] {
        UnitDimension.allCases
    }
    
    func getName(from unitDimension: UnitDimension) -> String {
        unitDimension.rawValue.capitalized
    }
    
    func getIcon(from unitDimension: UnitDimension) -> String {
        unitDimension.icon
    }
    
    func getMeasurementUnitsDescription(from unitDimension: UnitDimension) -> String {
        var description = String()
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        _ = unitDimension.units.map {
            if unitDimension.units.last == $0 {
                description.append(formatter.string(from: $0))
            } else {
                description.append("\(formatter.string(from: $0)), ")
            }
        }
        return description
    }
}

struct UnitDimensionsListView: View {
    private let viewModel = UnitDimensionsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.unitDimensions, id: \.self) { unitDimension in
                NavigationLink {
                    EmptyView()
                } label: {
                    VStack {
                        HStack(alignment: .top) {
                            Image(systemName: viewModel.getIcon(from: unitDimension))
                            VStack(alignment: .leading, spacing: 8) {
                                Text(viewModel.getName(from: unitDimension))
                                Text(viewModel.getMeasurementUnitsDescription(from: unitDimension))
                                    .font(.system(.caption))
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Unit Conversions")
            .padding()
        }
    }
}

#Preview {
    UnitDimensionsListView()
}
