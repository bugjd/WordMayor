import Foundation


public struct WordMayor {
    public private(set) var text = ["Good Day, World!"]

    public init() {
        text = WordGetter.getWords(fileLocation: "autumn-one")
        

        
        
        
    }
}
