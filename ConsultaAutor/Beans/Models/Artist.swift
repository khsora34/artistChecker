//
//  Artist.swift
//  ConsultaAutor
//
//  Created by Quico on 23/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Artist: Mappable, Comparable {
    
    var id: Int?
    var name: String?
    var genre: String?
    
    required init?(map: Map) {
        
    }
    
    init(_ artistId: Int, _ name: String, _ genre: String) {
        self.id = artistId
        self.name = name
        self.genre = genre
    }
    
    func mapping(map: Map) {
        id <- map["artistId"]
        name <- map["artistName"]
        genre <- map["primaryGenreName"]
    }
    
    static func <(lhs: Artist, rhs: Artist) -> Bool {
        guard let lessArtist = lhs.name else { return false }
        guard let bigArtist = rhs.name else { return false }
        
        return lessArtist.compare(bigArtist) == .orderedAscending
    }
    
    static func ==(lhs: Artist, rhs: Artist) -> Bool {
        return lhs.id == rhs.id
    }
    
}
