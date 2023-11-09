//
//  UnitDimensionsListViewModel.swift
//  UnitConverter
//
//  Created by Ivan Lopez on 09/11/23.
//

import Foundation

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
