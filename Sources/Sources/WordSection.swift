//
//  WordSection.swift
//  
//
//  Created by Jack Delaney on 17/08/2023.
//

import Foundation
import SwiftUI



public enum WordSection {
    case unsectioned
    case winterSeason
    case springSeason
    case autumnSeason
    case summerSeason
    
    public static func getSectionLabel(section : WordSection) -> Label<Text, Image>?  {
        switch(section) {
        case.winterSeason:
            return Label("Winter", systemImage: "snowflake")
        case .unsectioned:
            return nil
        case .springSeason:
            return Label("Spring", systemImage: "clock")
        case .autumnSeason:
            return Label("Autumn", systemImage: "leaf")
        case .summerSeason:
            return Label("Summer", systemImage: "sun.max.fill")
        }
    }
    
}
