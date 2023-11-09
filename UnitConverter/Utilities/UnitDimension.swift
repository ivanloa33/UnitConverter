//
//  UnitDimension.swift
//  UnitConverter
//
//  Created by Ivan Lopez on 09/11/23.
//

import Foundation

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
