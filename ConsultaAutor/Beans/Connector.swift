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
    func getArtistNameAndPrimaryGenre(term: String, completion: @escaping (_ artists: [Artist])->()) {
        let url = "https://itunes.apple.com/search?term=\(term)&country=es&media=music&entity=allArtist"
        Alamofire.request(url).responseObject { (response: DataResponse<Artists>) in
            if let results = response.value?.results {
                completion(results)
            }
        }
    }
    
    func getArtistsDiscographyById(id: Int){
        let url = "https://itunes.apple.com/search?term=\(id)&country=es&media=music&entity=allArtist"
        
    }
}
