//
//  Connector.swift
//  ConsultaAutor
//
//  Created by Quico on 23/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import Alamofire

class Connector {
    static func getResponseObject(term: String, completion: @escaping (_ artists: [Artist])->()) {
        let URL = "https://itunes.apple.com/search?term=\(term)&country=es&media=music&entity=allArtist"
        
        Alamofire.request(URL).responseObject { (response: DataResponse<Artists>) in
            if let artists = response.result.value {
                if let results = artists.results {
                    completion(results.sorted())
                }
            }
        }
    }
}
