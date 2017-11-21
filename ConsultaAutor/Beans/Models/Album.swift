//
//  Album.swift
//  ConsultaAutor
//
//  Created by Quico on 25/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Album: Mappable {
    var artistId: Int?
    var artistName: String?
    var primaryGenre: String?
    var artist: Artist? {
       guard let artistId = artistId, let name = artistName, let genre = primaryGenre else { return nil }
        return Artist(artistId, name, genre)
    }
    
    var albumName: String?
    var imageUrl: String?
    var year: String?
    
    required init?(map: Map) {
    }
    init() {
        albumName = "Esto no debería existir.";
        year = "9999"
    }
    
    func mapping(map: Map) {
        artistId <- map["artistId"]
        artistName <- map["artistName"]
        primaryGenre <- map["primaryGenreName"]
        albumName <- map["collectionName"]
        imageUrl <- map["artworkUrl100"]
        year <- map["releaseDate"]
    }
}
