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
        
        //let settingsURL = Bundle.module.url(forResource: "settings", withExtension: "plist")
       // let url = Bundle.module.url(forResource: "settings", withExtension: "plist")

        let url = Bundle.module.url(forResource: "autumn-one", withExtension: "txt")
        print(url ?? "Unkown")
        
        if let startWordsURL = Bundle.module.url(forResource: "autumn-one", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                contents = startWords.components(separatedBy: "\n")
                print("😃")
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
