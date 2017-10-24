//
//  Artists.swift
//  ConsultaAutor
//
//  Created by Quico on 23/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Artists: Mappable {
    
    var results: [Artist]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}
