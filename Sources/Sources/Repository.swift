//
//  Repository.swift
//  
//
//  Created by Jack Delaney on 19/08/2023.
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
