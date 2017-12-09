//
//  CardData.swift
//  Interests
//
//  Created by Scott Richards on 12/7/17.
//  Copyright © 2017 BitWyze. All rights reserved.
//

import UIKit


class CardData: NSObject {
    var headline = ""
    var abstract = ""
    var featuredImage : UIImage!
    static let BlogPostApiEndpoint = "https://stage.glassdoor.com/blog/wp-json/wp/v2/posts/"
    
    init(headline:String, abstract: String, featuredImage : UIImage!) {
        self.headline = headline
        self.abstract = abstract
        self.featuredImage = featuredImage
    }
    
    init(blogPost:BlogPost) {
        self.headline = blogPost.title
        self.abstract = blogPost.excerpt
    }
    
    static func createCards() -> [CardData] {
        return [
            CardData(headline:"Half Dome",abstract:"Beautiful sunset on the majestic granite Half Dome", featuredImage: UIImage(named:"nature-1")),
            CardData(headline:"Lake Tahoe",abstract:"Dock on the clear and deep Lake Tahoe", featuredImage: UIImage(named:"nature-2")),
            CardData(headline:"Lake Mead",abstract:"Stunning Lake Mead situated in the foothills", featuredImage: UIImage(named:"nature-3")),
            
        ]
    }
    
    
    
}
