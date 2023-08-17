//
//  File.swift
//  
//
//  Created by Jack Delaney on 17/08/2023.
//

import Foundation


public  struct WordGetter {
    
 
    
    var contents : [String]
    init() {
        print("Hello Today")
        contents = ["Hello"]
        
        let bundle = Bundle.module

        let txtFilePath = bundle.pathForResource("WordCatalogue/autumn-one", ofType: nil)
        
        
        print(txtFilePath)
        
        if let startWordsURL = Bundle.main.url(forResource: "WordCatalogue/autumn-one", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                contents = startWords.components(separatedBy: "\n")
            }
        }
        
        if contents.isEmpty {
            contents = ["Word Empty"]
            print("entered Empty Loop")

        }
        else {
            print("did not enter Empty Loop")

        }
    }
    
}
