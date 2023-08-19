//
//  File.swift
//  
//
//  Created by Jack Delaney on 17/08/2023.
//

import Foundation

internal  struct WordGetter {
    internal static func getWords(fileLocation : String) -> [String] {
        var contents = [""]
        if let startWordsURL = Bundle.module.url(forResource: fileLocation, withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                contents = startWords.components(separatedBy: "\n")
            }
        }
        
       
        contents = contents.filter { $0.count >= 1 }
        return contents.removingDuplicates()
        
    }
    
}
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
