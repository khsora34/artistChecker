//
//  UnwrapDiscography.swift
//  ConsultaAutor
//
//  Created by Quico on 26/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Discography: Mappable {
    var discography: [Album]?
    var count: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        discography <- map["results"]
        count <- map["resultCount"]
    }
}
