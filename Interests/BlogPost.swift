//
//  BlogPost.swift
//  Interests
//
//  Created by Scott Richards on 12/8/17.
//  Copyright © 2017 BitWyze. All rights reserved.
//

import Foundation


struct BlogPost {
    var title : String = ""
    var excerpt : String = ""
    var imageUrl : String = ""
    
    init(json: [String : Any]) {
        if let titleNode = json["title"] as? [String : Any] {
            if let title = titleNode["rendered"] as? String {
                self.title = title
            }
        }
        if let excerptNode = json["excerpt"] as? [String : Any] {
            if let excerpt = excerptNode["rendered"] as? String {
                self.excerpt = excerpt
            }

        }
        
    }
}
