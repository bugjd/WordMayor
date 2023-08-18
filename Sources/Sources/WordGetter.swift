//
//  File.swift
//  
//
//  Created by Jack Delaney on 17/08/2023.
//

import Foundation


public struct Repository : Identifiable {
    private(set) public var id: Int
    
    private(set) public var license : String
    private(set) public var licenseURL : URL
    private(set) public var author : String
    private(set) public var github : URL
    
    private init(id: Int, license: String, licenseURL: URL, author: String, github: URL) {
        self.id = id
        self.license = license
        self.licenseURL = licenseURL
        self.author = author
        self.github = github
    }
    static func selectRepoByID(id : Int) -> Repository {
        if(id == 0) {
            return repositorys[0]
        }
        else {
            return repositorys[1]
        }
    }
    public static var repositorys : [Repository] {
        return [Repository(id: 0,
                           license: "MIT License",
                           licenseURL: URL(string: "https://github.com/bugjd/WordCatalogue/blob/main/LICENSE.md")!, author: "Jack Delaney",
                           github: URL(string:"https://github.com/bugjd/WordCatalogue/tree/main")!),
                Repository(id: 1,
                                   license: "MIT License",
                                   licenseURL: URL(string: "https://github.com/jorgebucaran/fisher/blob/main/LICENSE.md")!, author: "Ivan Malopinsky",
                                   github: URL(string:"https://github.com/bugjd/wordlists")!)]
    }
}
public struct ChallengeList : Identifiable {
    private(set) public var id : Int
    private(set) public var challangeName : String
    private(set) public var preferedGridSize : Int
    private(set) public var maxTime : Int
    private(set) public var minTime : Int
    private(set) public var maxPoint : Int
    private(set) public var minPoint : Int
    private(set) public var wordSection : WordSection
    private(set) public var repository : Repository
    private(set) public var words : [String]
    
    
    public init(id: Int, challangeName: String, preferedGridSize: Int, maxTime: Int, minTime: Int, maxPoint: Int, minPoint: Int, wordSection: WordSection, repository: Repository, words: [String]) {
        self.id = id
        self.challangeName = challangeName
        self.preferedGridSize = preferedGridSize
        self.maxTime = maxTime
        self.minTime = minTime
        self.maxPoint = maxPoint
        self.minPoint = minPoint
        self.wordSection = wordSection
        self.repository = repository
        self.words = words
    }
    private init(id: Int, challangeName: String, preferedGridSize: Int, maxTime: Int, minTime: Int, maxPoint: Int, minPoint: Int, wordSection: WordSection, repositoryID: Int, wordLocation: String) {
        self.id = id
        self.challangeName = challangeName
        self.preferedGridSize = preferedGridSize
        self.maxTime = maxTime
        self.minTime = minTime
        self.maxPoint = maxPoint
        self.minPoint = minPoint
        self.wordSection = wordSection
        self.repository = Repository.selectRepoByID(id: repositoryID)
        self.words = WordGetter.getWords(fileLocation: wordLocation)
    }
    public static var readyMadeChallanges : [ChallengeList] {
        return [ChallengeList(id: 0, challangeName: "Autumn Selection",
                              preferedGridSize: 8,
                              maxTime: 120,
                              minTime: 40,
                              maxPoint: 90,
                              minPoint: 30,
                              wordSection:
                                WordSection.autumnSeason, repositoryID: 0, wordLocation: "autumn-one"),
                ChallengeList(id: 1, challangeName: "Fall Back",
                                      preferedGridSize: 6,
                                      maxTime: 70,
                                      minTime: 30,
                                      maxPoint: 100,
                                      minPoint: 20,
                                      wordSection:
                                WordSection.autumnSeason, repositoryID: 0, wordLocation: "autumn-other"),
                ChallengeList(id: 2, challangeName: "Jingle Bells",
                                      preferedGridSize: 6,
                                      maxTime: 120,
                                      minTime: 25,
                                      maxPoint: 250,
                                      minPoint: 25,
                                      wordSection:
                                        WordSection.winterSeason, repositoryID: 0, wordLocation: "christmas"),
                ChallengeList(id: 3, challangeName: "Easter",
                                      preferedGridSize: 6,
                                      maxTime: 120,
                                      minTime: 25,
                                      maxPoint: 250,
                                      minPoint: 25,
                                      wordSection:
                                WordSection.springSeason, repositoryID: 0, wordLocation: "easter"),
                ChallengeList(id: 4, challangeName: "Happy New Year!",
                                      preferedGridSize: 5,
                                      maxTime: 80,
                                      minTime: 25,
                                      maxPoint: 100,
                                      minPoint: 25,
                                      wordSection:
                                WordSection.winterSeason, repositoryID: 0, wordLocation: "new-year"),
                ChallengeList(id: 5, challangeName: "Spring Time",
                                      preferedGridSize: 7,
                                      maxTime: 90,
                                      minTime: 30,
                                      maxPoint: 90,
                                      minPoint: 25,
                                      wordSection:
                                WordSection.springSeason, repositoryID: 0, wordLocation: "spring-other")]
    }
    // This will only be avaible inside the package. Outside can provide array though!
}


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
