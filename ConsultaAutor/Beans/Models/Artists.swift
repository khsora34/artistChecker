//
//  Artists.swift
//  ConsultaAutor
//
//  Created by Quico on 31/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import ObjectMapper

class Artists: Mappable {
    var artists: [Artist]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        artists <- map["results"]
    }
    
    
}
