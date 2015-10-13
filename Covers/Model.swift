//
//  Model.swift
//  Covers
//
//  Created by Mac Bellingrath on 10/13/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import Argo
import Curry








struct AlbumArgo {
    let name: String
   
}

//extension Album: Decodable {
//    
//    static func create(name: [String: AnyObject?]) -> AlbumArgo {
//        return AlbumArgo(name: "name")
//        }
//    static func decode(json: JSON) -> Decoded<AlbumArgo> {
//       
//        return curry()
//           
//            <^> json <| "name"
//            <*> json <| "data"
//        
//    }
//    
//}


struct Album {
    let info: Dictionary
    
    init(info: Dictionary) {
        self.info = info
    }
}

