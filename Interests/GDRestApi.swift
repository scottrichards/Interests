//
//  GDRestApi.swift
//  GDSalary
//
//  Created by Scott Richards on 5/1/17.
//  Copyright © 2017 Glassdoor Inc. All rights reserved.
//

import UIKit

class GDRestApi: NSObject {
    
    // Do a GET call and return corresponding JSON object
    static func getJson(endpoint : String, params : [String : String]?, completion : @escaping (Any) -> Void, errorHandler : @escaping (Error?) -> Void) {
        guard var url = URL(string: endpoint) else {
            print("ERRROR: Cannot create url")
            return
        }
        // if we have parameter add them to the url
        if let params = params, params.count > 0 {
            var urlQueryItems = [URLQueryItem]()
            for (key, values) in params {
                urlQueryItems.append(URLQueryItem(name: key, value: values))
            }
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                urlComponents.queryItems = urlQueryItems
                if let componentsURL = urlComponents.url {
                    url = componentsURL
                }
            }
        }
        let urlRequest = URLRequest(url : url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            // check for errors
            guard error == nil else {
                print("error calling GET: \(endpoint)")
                errorHandler(error)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                errorHandler(nil)
                return
            }
//            print("ERROR: \(error)")
//            print("RESPONSE: \(response)")
//            print("DATA: \(data)")
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: responseData, options: [])
                completion(jsonObject)
                print("json: \(jsonObject)")
            } catch  {
                print("error trying to convert data to JSON")
                errorHandler(nil)
                return
            }
        }
        task.resume()
    }
    
    // Return Search Suggestions for the Keyword, Job Title
//    @objc public class func getSearchSuggestions(input : String, source: String, completion : @escaping ([String]) -> Void) {
//        let urlParams: [String: String] = [Constants.APIs.SearchSuggestions.Parameters.input: input, Constants.APIs.SearchSuggestions.Parameters.source : source, Constants.APIs.SearchSuggestions.Parameters.version : "New"]
//        
//        getJson(endpoint: Constants.APIs.SearchSuggestions.endpoint,
//                params: urlParams,
//                completion: { (jsonObject) in
//                    if let jsonArray = jsonObject as? [String] {
//                        // Execute on the main UI Thread, so it happens immediately
//                        DispatchQueue.main.async(execute: {
//                            completion(jsonArray)
//                        })
//                    }
//        },
//                errorHandler: { (error) in
//                    if let error = error {
//                        print("Received an Error: \(error.localizedDescription)")
//                    }
//                    
//        } )
//    }
}
