//
//  Connector.swift
//  ConsultaAutor
//
//  Created by Quico on 23/10/17.
//  Copyright © 2017 SetonciOS. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class Connector {
    func getArtistNameAndPrimaryGenre(terms: String, completion: @escaping (_ artists: [Artist])->()) {
        let url = "https://itunes.apple.com/search?term=\(terms)&country=es&media=music&entity=allArtist"
        Alamofire.request(url).responseObject { (response: DataResponse<Artists>) in
            if let answer = response.value?.artists {
                completion(answer)
            }
        }
    }
    
    
    func getArtistsDiscographyById(id: Int, completion: @escaping (_ discography: [Album])->()) {
        let url = "https://itunes.apple.com/lookup?id=\(id)&country=es&entity=album"
        Alamofire.request(url).responseObject { (response: DataResponse<Discography>) in
            print(response)
            if let answer = response.value?.discography {
                completion(answer)
            }
        }
    }
    
    
    func getImageFromUrl(url: String, completion: @escaping (_ image: Image) -> ()){
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                completion(image)
            }
        }
    }
}
