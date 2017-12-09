//
//  DataProvider.swift
//  Interests
//
//  Created by Scott Richards on 12/8/17.
//  Copyright © 2017 BitWyze. All rights reserved.
//

import UIKit

struct APIEndpoints {
    static let BlogPosts = "https://stage.glassdoor.com/blog/wp-json/wp/v2/posts/"
}

class DataProvider: NSObject {
    static let singleton = DataProvider()
    
    func loadBlogs(completion : @escaping ([CardData]) -> Void, errorHandler : @escaping (Error?) -> Void) {
        GDRestApi.getJson(endpoint: APIEndpoints.BlogPosts,
                          params: nil,
                          completion: { (jsonObject) in
                            if let dictionary = jsonObject as? [String: Any] {
                                print("dictionary: \(dictionary)")
                            }
                            if let array = jsonObject as? [Any] {
                                var cards = [CardData]()
                                for blogPost in array {
                                    if let blogDict = blogPost as? [String : Any] {
                                        print("blogDict: \(blogDict)")
                                        let blogPost = BlogPost(json: blogDict)
                                        cards.append(CardData(blogPost:blogPost))
                                    }
                                }
                                DispatchQueue.main.async(execute: {
                                    completion(cards)
                                })
                                
                            }
                            print("jsonObject: \(jsonObject)")},
                          errorHandler: {(error) in
                            DispatchQueue.main.async(execute: {
                                errorHandler(error)
                            })
        })
    }
}
