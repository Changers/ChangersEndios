//
//  Double+Extension.swift
//  WidgetChangers
//
//  Created by Clement Yerochewski on 26.01.22.
//

import Foundation

extension Double {
        
    func balanceString(unit: Bool = false, maxDigit: Int? = nil) -> String {
        let string: String
        switch self {
        case 0..<1:
            string = self.fractionDigits(min: 0, max: maxDigit ?? 2, roundingMode: .halfDown)
        case 0..<1000:
           string = self.fractionDigits(min: 0, max: maxDigit ?? 1, roundingMode: .halfDown)
        default:
            string = self.fractionDigits(min: 0, max: 0, roundingMode: .halfDown)
        }
        guard unit else {
            return string
        }
        return string + " " + "kg"
    }
        
    func toString() -> String {
        return self.fractionDigits(min: 0, max: 2)
    }
    
    func distanceString(unit: Bool = false) -> String {
        let string: String
        switch self {
        case 0..<1:
            string = self.fractionDigits(min: 0, max: 2, roundingMode: .halfDown)
        case 0..<1000:
           string = self.fractionDigits(min: 0, max: 1, roundingMode: .halfDown)
        default:
            string = self.fractionDigits(min: 0, max: 0, roundingMode: .halfDown)
        }
        guard unit else {
            return string
        }
        return string + " " + "km"

    }
    
    
    func convertDistanceToBigNumbers() -> Double {
        return self / 1000
    }
    
    
    func convertWeightToBigNumbers() -> Double {
        return self / 1000
    }
    
    

}

extension FloatingPoint {
    func fractionDigits(min: Int = 2, max: Int = 2, roundingMode: NumberFormatter.RoundingMode = .halfEven) -> String {
        let format = NumberFormatter()
        format.minimumFractionDigits = min
        format.maximumFractionDigits = max
        format.locale = Locale.current
        format.roundingMode = roundingMode
        format.numberStyle = .decimal
        return format.string(for: self) ?? ""
    }
}

