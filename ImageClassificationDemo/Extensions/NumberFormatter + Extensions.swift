//
//  NumberFormatter + Extensions.swift
//  ImageClassificationDemo
//
//  Created by EKbana on 14/05/2025.
//
import Foundation

extension NumberFormatter {
    static var percentage:NumberFormatter {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .percent
    numberFormatter.minimumFractionDigits = 2
    numberFormatter.maximumFractionDigits = 2
    return numberFormatter
}
}
